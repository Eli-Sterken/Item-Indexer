-- Migration number: 0004 	 2025-05-10T22:58:47.740Z

CREATE TABLE `Features` (
  `id` integer PRIMARY KEY,
  `photo` text NOT NULL,
  `header` text NOT NULL,
  `body` text NOT NULL,
  `animation` text NOT NULL
);