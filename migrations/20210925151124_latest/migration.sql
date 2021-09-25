/*
  Warnings:

  - You are about to drop the `_Post_comment_many` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_Post_comment_many" DROP CONSTRAINT "_Post_comment_many_A_fkey";

-- DropForeignKey
ALTER TABLE "_Post_comment_many" DROP CONSTRAINT "_Post_comment_many_B_fkey";

-- AlterTable
ALTER TABLE "Comment" ADD COLUMN     "post" TEXT;

-- DropTable
DROP TABLE "_Post_comment_many";

-- CreateIndex
CREATE INDEX "Comment.post_index" ON "Comment"("post");

-- AddForeignKey
ALTER TABLE "Comment" ADD FOREIGN KEY ("post") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;
