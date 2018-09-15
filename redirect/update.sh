set GOOS=linux
set GOARCH=amd64

go build -o redirect main.go
zip deployment.zip redirect

aws lambda update-function-code --function-name RedirectFunction --region us-east-2 --zip-file fileb://./deployment.zip