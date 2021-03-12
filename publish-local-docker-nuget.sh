dotnet pack src/Giraffe/Elmish.Bridge.Giraffe.fsproj

docker run -d \
  --restart unless-stopped \
  --name nuget-server \
  -p 5555:80 \
  loicsharma/baget

sleep 3

dotnet nuget push \
  -s http://localhost:5555/v3/index.json \
  ./dist/Elmish.Bridge.Giraffe.5.0.0-rc1.nupkg
