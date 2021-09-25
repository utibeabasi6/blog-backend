-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "comment" TEXT,
ADD COLUMN     "coverImage_extension" TEXT,
ADD COLUMN     "coverImage_filesize" INTEGER,
ADD COLUMN     "coverImage_height" INTEGER,
ADD COLUMN     "coverImage_id" TEXT,
ADD COLUMN     "coverImage_mode" TEXT,
ADD COLUMN     "coverImage_width" INTEGER;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "status" TEXT;

-- CreateTable
CREATE TABLE "Comment" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT,
    "comment" TEXT,

    PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Post.comment_index" ON "Post"("comment");

-- AddForeignKey
ALTER TABLE "Post" ADD FOREIGN KEY ("comment") REFERENCES "Comment"("id") ON DELETE SET NULL ON UPDATE CASCADE;
