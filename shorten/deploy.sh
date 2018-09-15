set GOOS=linux
set GOARCH=amd64

go build -o shorten main.go
zip deployment.zip shorten

aws lambda create-function --region us-east-2 --function-name ShortenFunction --zip-file fileb://./deployment.zip --runtime go1.x --tracing-config Mode=Active --role $ROLE --handler shorten