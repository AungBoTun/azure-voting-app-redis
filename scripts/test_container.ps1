$count = 0
do {
     $count ++ 
     Write-output "[$env:STAGE_NAME] Starting container [Attempt: $count"
     $teststart = Invoke-WebRequest -Uri http://localhost:8000

     if (%teststart.statuscode -eq '200') {
         $started = $true

     }else {
         Start-Sleep -seconds 1 
     }

} until ($Started -or ($count -eq 3))

if (!$Started){
    exit 1
}