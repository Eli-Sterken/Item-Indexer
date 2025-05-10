-- Migration number: 0001 	 2025-05-10T22:51:34.853Z

CREATE TABLE `Accounts` (
  `id` integer PRIMARY KEY,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `admin` boolean NOT NULL,
  `photo` text NOT NULL,
  `timestamp` integer NOT NULL
);