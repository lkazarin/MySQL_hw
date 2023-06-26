-- 1) Наполнить произвольными данными таблицы streams, reactions, donations
INSERT INTO streams (stream_id, created_at, author_id, title, is_completed)
VALUES (1, CURRENT_TIMESTAMP, '12', 'vasya_pupkin', true),
       (2, CURRENT_TIMESTAMP, '26', 'ivan_petrov', false),
       (3, CURRENT_TIMESTAMP, '31', 'petr_ivanov', true);

INSERT INTO reactions (reaction_id, created_at, author_id, stream_id, value)
VALUES (1, CURRENT_TIMESTAMP, '12', '2', 1),
       (2, CURRENT_TIMESTAMP, '26', '3', 3),
       (3, CURRENT_TIMESTAMP, '31', '1', 5);

INSERT INTO donations (donation_id, created_at, amount, donator_id, stream_id)
VALUES (1, CURRENT_TIMESTAMP, '100', '24', 3),
       (2, CURRENT_TIMESTAMP, '75', '31', 2),
       (3, CURRENT_TIMESTAMP, '25', '11', 1);

-- 2) Вывести информацию по стримам (проекция: имя автора, название стрима)
SELECT users.username, streams.title
FROM streams
JOIN users ON streams.author_id = users.user_id;

-- 3) Вывести список пожертвований в порядке убывания размера 
-- (проекция: размерпожертвования, имядонатара, название_стрима)

SELECT donations.amount, users.username, donations.stream_id
FROM donations
JOIN users ON donations.donator_id = users.user_id
ORDER BY donations.amount DESC;