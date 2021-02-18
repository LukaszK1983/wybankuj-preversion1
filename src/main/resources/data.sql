INSERT INTO banks (bank_name, logo) VALUES ('PKO BP', 'logopko.jpg');
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '09:00 - 17:00', '322003300', 'Katowicka', '5A', '40-000', 1);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Tychach', 'Tychy', 'bank@wybankuj.pl', '10:00 - 18:00', '322004401', 'Tyska', '22', '43-100', 1);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('2 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '10:00 - 18:00', '322004400', 'Gliwicka', '122', '40-001', 1);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Sosnowcu', 'Sosnowiec', 'bank@wybankuj.pl', '09:30 - 17:30', '322004402', '3 Maja', '7', '41-200', 1);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('6 Oddział w Gliwicach', 'Gliwice', 'bank@wybankuj.pl', '09:00 - 17:00', '322004403', 'Zabrska', '79', '44-100', 1);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (8.58, 2.0, 70, 100000, 120, 18, 5000, 'Zima', 2.50, 1);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (9.79, 0.0, 70, 100000, 120, 18, 5000, 'Tania Zima', 0.0, 1);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (10.0, 4.08, 2.0, 75, 2000000, 360, 18, 10000, 'Zimowa', 0.50, 1);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (10.0, 3.58, 0.0, 75, 2000000, 360, 18, 10000, 'Twój Dom', 0.0, 1);

INSERT INTO banks (bank_name, logo) VALUES ('Pekao SA', 'logopekao.jpg');
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '10:00 - 18:00', '323004500', 'Opolska', '1', '40-101', 2);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('2 Oddział w Tychach', 'Tychy', 'bank@wybankuj.pl', '09:00 - 17:00', '323004600', 'Kościelna', '14A', '43-100', 2);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('3 Oddział w Sosnowcu', 'Sosnowiec', 'bank@wybankuj.pl', '09:30 - 17:30', '323004700', 'Milowicka', '389', '41-201', 2);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('5 Oddział w Tychach', 'Tychy', 'bank@wybankuj.pl', '10:00 - 18:00', '323004800', 'Wysoka', '68C', '43-101', 2);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Gliwicach', 'Gliwice', 'bank@wybankuj.pl', '09:00 - 17:00', '323004900', 'Krakowska', '8', '44-101', 2);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (9.58, 0.0, 80, 200000, 96, 18, 15000, 'Zimowa', 9.50, 2);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (8.88, 3.0, 70, 160000, 120, 18, 20000, 'Super', 0.0, 2);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (10.0, 3.99, 0.5, 70, 2000000, 360, 18, 10000, 'Hipo', 1.0, 2);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (10.0, 4.49, 0.0, 70, 2000000, 360, 18, 10000, 'Hipo2', 0.0, 2);

INSERT INTO banks (bank_name, logo) VALUES ('Millennium', 'logomillennium.jpg');
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '09:30 - 17:30', '324504400', 'Kościuszki', '23', '40-201', 3);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('3 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '10:00 - 18:00', '324604400', 'Panewnicka', '309', '40-501', 3);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Sosnowcu', 'Sosnowiec', 'bank@wybankuj.pl', '09:30 - 17:30', '324704400', 'Wawelska', '46B', '41-201', 3);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('4 Oddział w Gliwicach', 'Gliwice', 'bank@wybankuj.pl', '09:00 - 17:00', '324804400', 'Bolka', '3', '44-201', 3);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('2 Oddział w Tychach', 'Tychy', 'bank@wybankuj.pl', '10:00 - 18:00', '324904400', 'Zygmunta', '46', '43-101', 3);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (7.58, 0.0, 75, 150000, 96, 18, 10000, 'Najlepsza', 6.50, 3);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (9.39, 1.0, 75, 150000, 96, 18, 10000, 'Niedroga', 1.50, 3);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (10.0, 3.58, 0.0, 80, 2000000, 360, 18, 50000, 'Zimowa', 0.50, 3);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (10.0, 4.09, 0.0, 80, 2000000, 360, 18, 50000, 'Zaraz wiosenna', 0.00, 3);

INSERT INTO banks (bank_name, logo) VALUES ('mBank', 'logombank.jpg');
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('2 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '09:30 - 17:30', '324524400', 'Plebiscytowa', '3', '40-401', 4);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('9 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '10:00 - 18:00', '324544400', 'Piotrowicka', '88', '40-631', 4);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('3 Oddział w Sosnowcu', 'Sosnowiec', 'bank@wybankuj.pl', '09:30 - 17:30', '324564400', 'Podwawelska', '4', '41-221', 4);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('7 Oddział w Gliwicach', 'Gliwice', 'bank@wybankuj.pl', '09:00 - 17:00', '324584400', 'Toruńska', '39', '44-211', 4);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('6 Oddział w Tychach', 'Tychy', 'bank@wybankuj.pl', '10:00 - 18:00', '324534400', 'Śląska', '72F', '43-105', 4);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (9.68, 1.0, 70, 150000, 84, 18, 10000, 'Jedyna', 5.50, 4);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (9.99, 1.0, 70, 150000, 120, 18, 10000, 'Czy ta?', 1.50, 4);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (20.0, 3.78, 0.0, 70, 2000000, 360, 18, 50000, 'Wiosna', 1.50, 4);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (20.0, 4.29, 0.0, 67, 2000000, 360, 18, 50000, 'Chata', 0.20, 4);

INSERT INTO banks (bank_name, logo) VALUES ('BNP', 'logobnp.jpg');
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '09:30 - 17:30', '326524400', 'Konopnickiej', '3', '40-622', 5);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('7 Oddział w Sosnowcu', 'Sosnowiec', 'bank@wybankuj.pl', '08:00 - 18:00', '326124400', 'Reja', '33', '41-266', 5);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('2 Oddział w Sosnowcu', 'Sosnowiec', 'bank@wybankuj.pl', '09:00 - 17:00', '326224400', 'Luizy', '17', '41-250', 5);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('2 Oddział w Gliwicach', 'Gliwice', 'bank@wybankuj.pl', '10:00 - 18:00', '326324400', 'Zimna', '11', '44-121', 5);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Tychach', 'Tychy', 'bank@wybankuj.pl', '09:30 - 17:30', '326424400', 'Garncarska', '121', '43-100', 5);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (8.80, 2.50, 75, 150000, 84, 18, 1000, 'Rozkoszna', 3.00, 5);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (9.10, 1.80, 75, 150000, 120, 18, 1000, 'Miła', 2.80, 5);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (20.0, 4.3, 0.0, 80, 1000000, 360, 18, 25000, 'Szczęśliwe Gniazdko', 0.0, 5);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (20.0, 3.9, 1.0, 80, 1000000, 360, 18, 25000, 'Miła Przystań', 1.0, 5);

INSERT INTO banks (bank_name, logo) VALUES ('Santander', 'logosantander.jpg');
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('2 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '08:00 - 18:00', '327024400', 'Kościuszki', '197', '40-670', 6);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('9 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '08:00 - 18:00', '327124400', 'Warszawska', '1', '40-030', 6);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('9 Oddział w Sosnowiec', 'Sosnowiec', 'bank@wybankuj.pl', '09:00 - 17:00', '327324400', 'Lwowska', '22', '41-233', 6);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('7 Oddział w Gliwicach', 'Gliwice', 'bank@wybankuj.pl', '09:00 - 17:00', '327424400', 'Roosevelta', '90', '44-199', 6);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('3 Oddział w Tychach', 'Tychy', 'bank@wybankuj.pl', '09:00 - 17:00', '327524400', 'Katowicka', '72', '43-191', 6);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (9.88, 0.0, 70, 160000, 96, 18, 20000, 'Wspaniała', 0.0, 6);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (9.3, 0.0, 70, 160000, 96, 18, 20000, 'Czarująca', 1.5, 6);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (10.0, 3.91, 1.10, 80, 1000000, 360, 18, 25000, 'Niebiańska', 1.25, 6);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (10.0, 4.91, 0.0, 80, 1000000, 360, 18, 25000, 'Piekielna', 0.0, 6);

INSERT INTO banks (bank_name, logo) VALUES ('BOŚ', 'logobos.jpg');
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('4 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '08:00 - 18:00', '322024410', 'Sobieskiego', '30', '40-230', 7);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('5 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '09:00 - 17:00', '322024420', 'Korfantego', '2', '40-023', 7);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Sosnowcu', 'Sosnowiec', 'bank@wybankuj.pl', '10:00 - 18:00', '322024430', 'Moniuszki', '52', '41-102', 7);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Gliwicach', 'Gliwice', 'bank@wybankuj.pl', '10:00 - 18:00', '322024440', 'Kochanowskiego', '13', '44-172', 7);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('2 Oddział w Tychach', 'Tychy', 'bank@wybankuj.pl', '10:00 - 18:00', '322024450', 'Dmowskiego', '6', '43-102', 7);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (9.79, 0.50, 75, 150000, 96, 18, 5000, 'Przepyszna', 0.0, 7);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (9.19, 0.50, 75, 150000, 96, 18, 5000, 'Przepyszniejsza', 1.0, 7);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (20.0, 3.51, 1.90, 80, 1000000, 360, 18, 15000, 'Chatka Puchatka', 2.25, 7);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (20.0, 4.51, 0.90, 80, 1000000, 360, 18, 15000, 'Chatka Prosiaczka', 0.25, 7);

INSERT INTO banks (bank_name, logo) VALUES ('Alior', 'logoalior.jpg');
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '08:00 - 18:00', '323124410', 'Marianny', '45', '40-330', 8);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('2 Oddział w Tychach', 'Tychy', 'bank@wybankuj.pl', '09:00 - 17:00', '323224410', 'Okrągła', '88', '43-103', 8);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('3 Oddział w Sosnowcu', 'Sosnowiec', 'bank@wybankuj.pl', '09:30 - 17:30', '323324410', 'Prostokątna', '51', '41-200', 8);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('4 Oddział w Gliwicach', 'Gliwice', 'bank@wybankuj.pl', '09:30 - 17:30', '323424410', 'Kwadratowa', '4', '44-100', 8);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('5 Oddział w Gliwicach', 'Gliwice', 'bank@wybankuj.pl', '09:30 - 17:30', '323524410', 'Trójkątna', '303', '44-101', 8);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (7.19, 0.0, 80, 200000, 144, 18, 500, 'Specjalna', 20.90, 8);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (7.19, 0.0, 80, 70000, 48, 18, 500, 'Express', 10.99, 8);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (7.19, 0.0, 80, 200000, 144, 18, 500, 'Standard', 28.90, 8);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (7.19, 0.0, 80, 200000, 144, 18, 500, 'HIP Pożyczka', 17.90, 8);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (7.19, 0.0, 80, 200000, 144, 18, 500, 'VIP Pożyczka', 17.90, 8);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (10.0, 4.47, 3.00, 80, 4000000, 360, 18, 10000, 'Aliorowa', 1.0, 8);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (10.0, 4.29, 2.50, 80, 4000000, 360, 18, 10000, 'Aliorowsza', 2.2, 8);

INSERT INTO banks (bank_name, logo) VALUES ('ING', 'logoing.jpg');
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '08:00 - 18:00', '323120410', 'Sokolska', '45', '40-130', 9);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('2 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '09:30 - 17:30', '323121410', 'Chorzowska', '50', '40-131', 9);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Tychach', 'Tychy', 'bank@wybankuj.pl', '09:30 - 17:30', '323122410', 'Pocztowa', '15', '43-100', 9);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('3 Oddział w Sosnowcu', 'Sosnowiec', 'bank@wybankuj.pl', '09:00 - 17:00', '323123410', 'Pszczyńska', '131', '41-200', 9);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Gliwicach', 'Gliwice', 'bank@wybankuj.pl', '09:00 - 17:00', '323124410', 'Kolejowa', '21', '44-110', 9);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (8.08, 0.50, 80, 160000, 120, 18, 1000, 'Dla Ciebie', 2.9, 9);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (8.99, 1.50, 80, 160000, 96, 18, 1000, 'Dla Marzeń', 1.9, 9);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (20.0, 3.99, 1.00, 80, 3000000, 360, 18, 10000, 'Domek z Bajki', 0.50, 9);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (20.0, 3.69, 1.50, 80, 3000000, 360, 18, 10000, 'Poetycka', 2.00, 9);

INSERT INTO banks (bank_name, logo) VALUES ('Pocztowy', 'logopocztowy.jpg');
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('8 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '08:00 - 18:00', '327770410', 'Zielona', '12', '40-730', 10);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('9 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '10:00 - 18:00', '327772410', 'Czerwona', '61C', '40-530', 10);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Tychach', 'Tychy', 'bank@wybankuj.pl', '09:00 - 17:00', '327773410', 'Biała', '27', '43-153', 10);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('2 Oddział w Sosnowcu', 'Sosnowiec', 'bank@wybankuj.pl', '09:00 - 17:00', '327774410', 'Żółta', '34', '41-201', 10);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Gliwicach', 'Gliwice', 'bank@wybankuj.pl', '09:30 - 17:30', '327775410', 'Czarna', '77', '44-201', 10);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (6.20, 0.0, 80, 50000, 120, 18, 2000, 'EKO Cele', 8.0, 10);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (7.20, 0.0, 80, 5000, 36, 18, 300, 'Dla Emerytów', 5.0, 10);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (7.20, 0.0, 80, 100000, 120, 18, 10000, 'ZOR', 8.0, 10);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (7.20, 0.0, 80, 100000, 120, 18, 300, 'Stałej Ceny', 12.0, 10);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (7.20, 0.0, 80, 200000, 120, 18, 100000, 'Stałej Ceny', 12.0, 10);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (20.0, 4.19, 0.00, 80, 2000000, 360, 18, 10000, 'Pocztowa', 1.00, 10);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (20.0, 3.89, 2.00, 80, 2000000, 360, 18, 10000, 'Tania Pocztowa', 1.00, 10);

INSERT INTO banks (bank_name, logo) VALUES ('Getin', 'logogetin.jpg');
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '09:00 - 17:00', '328770410', 'Rowerowa', '3', '40-830', 11);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('3 Oddział w Katowicach', 'Katowice', 'bank@wybankuj.pl', '09:00 - 17:00', '328770411', 'Hulajnogowa', '92', '40-930', 11);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('2 Oddział w Sosnowcu', 'Sosnowiec', 'bank@wybankuj.pl', '09:30 - 17:30', '328770412', 'Deskorolkowa', '102', '41-220', 11);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('1 Oddział w Tychach', 'Tychy', 'bank@wybankuj.pl', '09:30 - 17:30', '328770413', 'Motocyklowa', '112', '43-104', 11);
INSERT INTO agencies (agency_name, city, email, hours, phone, street, street_number, zip_code, bank_id) VALUES ('3 Oddział w Gliwicach', 'Gliwice', 'bank@wybankuj.pl', '09:00 - 17:00', '328770414', 'Rolkowa', '212', '44-107', 11);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (9.39, 0.70, 75, 180000, 120, 18, 5000, 'Prawie Wiosna', 5.0, 11);
INSERT INTO loans (credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (9.89, 0.70, 75, 180000, 120, 18, 5000, 'Wiosenna', 1.0, 11);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (10.0, 4.49, 1.00, 80, 3000000, 360, 18, 10000, 'Prezentowa', 0.00, 11);
INSERT INTO mortgages (contribution_percent, credit_rate, insurance, max_borrower_age, max_credit_amount, max_credit_period, min_borrower_age, min_credit_amount, offer, service_charge, bank_id) VALUES (10.0, 4.01, 1.50, 80, 3000000, 360, 18, 10000, 'Wykwintna', 2.00, 11);