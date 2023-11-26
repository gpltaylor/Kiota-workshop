# Define a variable for the post ID
POST_ID ?= default_value
BODY ?= default_value
FILE_NAME ?= create-request-v1.json

define escape_string
$body = $(1) -replace '\\', '\\\\' -replace '"', '\"'
endef

clean:
	dotnet clean
	rm -fr ./src/Client
	rm -fr ./obj
	rm -fr ./bin

build: clean
	dotnet build

generate:
	kiota generate -l CLI -c PostsClient -n KiotaPostsCLI.Client -d ./posts-api.yml -o ./src/Client

posts-list:
	dotnet run -- posts list

# make posts-get POST_ID=5
posts-get:
	dotnet run -- posts get --post-id $(POST_ID)

# $body = Get-Content -Path .\create-request-v1.json -Raw
# $body = '{ "userId": 42, "title": "Testing Kiota-generated API client", "body": "Hello world!" }'
# $body = $body -replace '\\', '\\\\' -replace '"', '\"'
# make posts-create BODY="$body"
#
# body=`cat create-request-v1.json`
# make posts-create BODY="$body"
posts-create:
	dotnet run -- posts create --body '$(BODY)'

# make posts-patch '{ "title": "Updated title" }'
posts-patch:
	dotnet run -- posts patch --post-id 5 --body '$(BODY)'

posts-delete:
	dotnet run -- posts delete --post-id $(POST_ID)

show-shell:
	@echo "Using shell: $(SHELL)"

