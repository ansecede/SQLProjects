-- Task description: https://cs50.harvard.edu/x/2022/psets/7/fiftyville/


-- Keep a log of any SQL queries you execute as you solve the mystery.
-- Query to have a general look of the crime scenes and their dates
SELECT *
  FROM crime_scene_reports;
-- Most if not all crimes in the database date from the year 2021, so we just need to filter day, month and street
SELECT *
  FROM crime_scene_reports
  WHERE day = 28
    AND month = 7
    AND street = "Humphrey Street";
-- The last query description column metions 3 interviews, all off them metion the bakery, so this query is used to search and check them.
SELECT name, transcript
  FROM interviews
  WHERE day = 28
    AND month = 7
    AND year = 2021
    AND  transcript LIKE "%bakery%";
-- Witness Eugene saw the thief withdrawing some money at the ATM on Leggett Street in the morning.
-- This query is to check how many withdraws were done on July 28 and to get the account numbers
SELECT *
  FROM atm_transactions
 WHERE day = 28
   AND month = 7
   AND year = 2021
   AND atm_location = "Leggett Street"
   AND transaction_type = "withdraw";
-- Now that we have the account numbers we can follow this lead to get the names of the owners, and with those we're gonna have some suspects.
-- This query links the accounts numbers with the name of the owner. These now are suspects. We also take some relevant data to check other witnesses testimonies.
-- We have now 8 suspects. This query will be our base table, in which we will relate the attributes with the clues to rule out suspects.
SELECT ba.account_number, p.name, p.phone_number, p.passport_number, p.license_plate
  FROM bank_accounts AS ba JOIN people AS p
    ON ba.person_id = p.id
 WHERE ba.account_number IN (SELECT account_number
                               FROM atm_transactions
                              WHERE day = 28
                                AND month = 7
                                AND year = 2021
                                AND atm_location = "Leggett Street"
                                AND transaction_type = "withdraw");
-- Now, following Ruth's testimony, we are going to check the cars that exited the bakery around the time of the robbery.
-- Ruth said he escaped within 10 minutes of the theft, so this can help us to further narrow down the posibilities.
-- From the crime_scene_reports table we know the theft took place at 10:15
-- Using the base table now we search the suspects' license plate that matches the condition given in the 3 lines above
-- We have reduce our suspects from 8 to 4.
SELECT ba.account_number, p.name, p.phone_number, p.passport_number, p.license_plate
 FROM bank_accounts AS ba JOIN people AS p
   ON ba.person_id = p.id
WHERE ba.account_number IN
      (SELECT account_number
         FROM atm_transactions
        WHERE day = 28
          AND month = 7
          AND year = 2021
          AND atm_location = "Leggett Street"
          AND transaction_type = "withdraw")
  AND p.license_plate IN
      (SELECT license_plate
         FROM bakery_security_logs
        WHERE day = 28
          AND month = 7
          AND year = 2021
          AND hour = 10
          AND activity = "exit"
          AND minute BETWEEN 15 AND 25);
-- Last testimony to check is Raymond's, which we have to divide in to parts, first check the phone_calls, and then the flights
-- We add to the base query a subquerie that searches calls form the July 28 that had a duration less than 60 seconds, to match them with the phone_number row.
-- We have reduce our suspects from 4 to 2.
SELECT ba.account_number, p.name, p.phone_number, p.passport_number, p.license_plate
 FROM bank_accounts AS ba JOIN people AS p
   ON ba.person_id = p.id
WHERE ba.account_number IN
      (SELECT account_number
         FROM atm_transactions
        WHERE day = 28
          AND month = 7
          AND year = 2021
          AND atm_location = "Leggett Street"
          AND transaction_type = "withdraw")
  AND p.license_plate IN
      (SELECT license_plate
         FROM bakery_security_logs
        WHERE day = 28
          AND month = 7
          AND year = 2021
          AND hour = 10
          AND activity = "exit"
          AND minute BETWEEN 15 AND 25)
  AND p.phone_number IN
      (SELECT caller
         FROM phone_calls
        WHERE day = 28
          AND month = 7
          AND year = 2021
          AND duration < 60);
-- Now it's time to check the flights. The testimony tolds that the thie wants to take the first flight tomorrow (July 29) out of Fiftyville.
-- Checking the flights table we realise we need the airport id from Fiftyville:
SELECT id
  FROM airports
 WHERE city = "Fiftyville";
--Now we search on the flight table, using the query above to match the origin_airport_id row:
SELECT *
  FROM flights
 WHERE day = 29
   AND month = 7
   AND year = 2021
   AND origin_airport_id = (SELECT id
                              FROM airports
                             WHERE city = "Fiftyville");
-- Analizing the table we can see the earliest flight is at 8. We need the passengers of that fly, which can be found on the passengers table.
-- To search in it we need the flight id. Its possible to get it using the next querie:
SELECT id
  FROM flights
 WHERE day = 29
   AND month = 7
   AND year = 2021}
   AND origin_airport_id = (SELECT id
                              FROM airports
                             WHERE city = "Fiftyville")
   AND hour = (SELECT MIN(hour)
                 FROM flights
                WHERE day = 29
                  AND month = 7
                  AND year = 2021
                  AND origin_airport_id = (SELECT id
                              FROM airports
                             WHERE city = "Fiftyville"));
--This query returns the number 36, so we have to search in the passengers table a fligth = query_above
-- But the main querie is long enough so i just take the number and input it directly
SELECT passport_number FROM passengers WHERE flight_id = 36; -- = Subquery

-- Finally we input that in the main query to discard the last suspect
SELECT ba.account_number, p.name, p.phone_number, p.passport_number, p.license_plate
 FROM bank_accounts AS ba JOIN people AS p
   ON ba.person_id = p.id
WHERE ba.account_number IN
      (SELECT account_number
         FROM atm_transactions
        WHERE day = 28
          AND month = 7
          AND year = 2021
          AND atm_location = "Leggett Street"
          AND transaction_type = "withdraw")
  AND p.license_plate IN
      (SELECT license_plate
         FROM bakery_security_logs
        WHERE day = 28
          AND month = 7
          AND year = 2021
          AND hour = 10
          AND activity = "exit"
          AND minute BETWEEN 15 AND 25)
  AND p.phone_number IN
      (SELECT caller
         FROM phone_calls
        WHERE day = 28
          AND month = 7
          AND year = 2021
          AND duration < 60)
  AND p.passport_number IN
      (SELECT passport_number
         FROM passengers
        WHERE flight_id = 36);
-- Now we have the thief, which is Bruce
-- Going a little back we know the destination_airport_id is 4, and with a simple query we can get the city, which is New York City
SELECT *
  FROM airports
 WHERE id = 4;
-- The last thing we need is the accomplice. We can get his name using Bruce phone number () and modifying one of the subqueries from the base table
-- This query give us the accomplice name: Robin
SELECT *
  FROM people
 WHERE phone_number = (SELECT receiver
                         FROM phone_calls
                        WHERE day = 28
                          AND month = 7
                          AND year = 2021
                          AND duration < 60
                          AND caller = "(367) 555-5533");