-- Title: Exchange Seats
-- ID: Q02
-- Difficulty: Medium
-- Concepts: Window Functions (LAG, LEAD), CASE, COALESCE
-- Schema:
--   Seat(id INT, student VARCHAR)
-- Problem (paraphrased):
--   - Students are sitting in a row, each has an id (1, 2, 3…).
--   - Swap every two consecutive students:
--       • For even id → swap with the previous student.
--       • For odd id → swap with the next student.
--   - If the last student is odd and has no pair, keep them in place.

-- Approach:
--   - Use LAG(student) for even ids (brings previous student's name).
--   - Use LEAD(student) for odd ids (brings next student's name).
--   - Handle last student case using COALESCE (if no next student → keep self).
--   - Maintain original id order in output.

-- Solution:
SELECT 
    id,
    CASE
        WHEN id % 2 = 0 THEN LAG(student) OVER (ORDER BY id)
        ELSE COALESCE(LEAD(student) OVER (ORDER BY id), student)
    END AS student
FROM Seat;

-- Explanation:
--   - For even rows: replace with previous student's name (LAG).
--   - For odd rows: replace with next student's name (LEAD).
--   - COALESCE ensures last student (if odd and unmatched) stays the same.
--   - Query preserves the original `id` order.
