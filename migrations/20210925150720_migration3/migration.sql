/*
  Warnings:

  - You are about to drop the column `comment` on the `Post` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_comment_fkey";

-- DropIndex
DROP INDEX "Post.comment_index";

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "comment";

-- CreateTable
CREATE TABLE "_Post_comment_many" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_Post_comment_many_AB_unique" ON "_Post_comment_many"("A", "B");

-- CreateIndex
CREATE INDEX "_Post_comment_many_B_index" ON "_Post_comment_many"("B");

-- AddForeignKey
ALTER TABLE "_Post_comment_many" ADD FOREIGN KEY ("A") REFERENCES "Comment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_comment_many" ADD FOREIGN KEY ("B") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;
