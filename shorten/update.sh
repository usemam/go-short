set GOOS=linux
set GOARCH=amd64

go build -o shorten main.go
zip deployment.zip shorten

aws lambda update-function-code --function-name ShortenFunction --region us-east-2 --zip-file fileb://./deployment.zip