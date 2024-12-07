/*
  Warnings:

  - Added the required column `api_id` to the `Movie` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Movie" ADD COLUMN     "api_id" INTEGER NOT NULL;
