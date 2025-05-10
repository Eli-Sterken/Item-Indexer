-- Migration number: 0002 	 2025-05-10T22:54:05.213Z

CREATE TABLE `Collections` (
  `id` integer PRIMARY KEY,
  `accountId` integer NOT NULL,
  `name` text NOT NULL
);