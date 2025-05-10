-- Migration number: 0003 	 2025-05-10T22:55:27.172Z

CREATE TABLE `Items` (
  `id` integer PRIMARY KEY,
  `collectionId` integer NOT NULL,
  `code` integer NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL
);