/*
  Warnings:

  - You are about to drop the column `createdAt` on the `Movie` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Movie` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Movie" DROP CONSTRAINT "Movie_watchListId_fkey";

-- AlterTable
ALTER TABLE "Movie" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ALTER COLUMN "watchListId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Movie" ADD CONSTRAINT "Movie_watchListId_fkey" FOREIGN KEY ("watchListId") REFERENCES "WatchList"("id") ON DELETE SET NULL ON UPDATE CASCADE;
