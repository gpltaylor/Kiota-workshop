echo "Generating and building solution"
make generate

echo "Building solution"
dotnet build

echo "Getting list of posts"
make posts-list

echo "Getting post with id 1"
make posts-get POST_ID=1

echo "Creating new post"
body=`cat create-request-v1.json`
make posts-create BODY="$body"

echo "Updating post with id 1"
make posts-patch BODY='{ "title": "Updated title" }'

echo "Deleting post with id 1"
make post-delete POST_ID=1

echo "Thank you for using Kiota!"