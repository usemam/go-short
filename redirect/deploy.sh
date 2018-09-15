set GOOS=linux
set GOARCH=amd64

go build -o redirect main.go
zip deployment.zip redirect

aws lambda create-function --region us-east-2 --function-name RedirectFunction --zip-file fileb://./deployment.zip --runtime go1.x --tracing-config Mode=Active --role $ROLE --handler redirect