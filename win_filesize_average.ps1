$count_total = 0
$size_total = 0
$count_1k = 0
$size_1k = 0
$count_4k = 0
$size_4k = 0
$count_16k = 0
$size_16k = 0
$count_32k = 0
$size_32k = 0
$count_64k = 0
$size_64k = 0
$count_else = 0
$size_else = 0

$foo = Get-ChildItem -path "c:\" -Recurse -File | ForEach-Object {
	if($_.Length -le 1KB) {
		$count_1k++
		$size_1k += $_.Length
	}
	ElseIf ($_.Length -le 4KB) {
		$count_4k++
		$size_4k += $_.Length	
	}
	ElseIf ($_.Length -le 16KB) {
		$count_16k++
		$size_16k += $_.Length	
	}
	ElseIf ($_.Length -le 32KB) {
		$count_32k++
		$size_32k += $_.Length	
	}
	ElseIf ($_.Length -le 64KB) {
		$count_64k++
		$size_64k += $_.Length	
	}
	Else {
		$count_else++
		$size_else += $_.Length	
	}
	$count_total++
	$size_total += $_.Length

}

$size_1k = $size_1k / 1GB
$size_4k = $size_4k / 1GB
$size_16k = $size_16k / 1GB
$size_32k = $size_32k / 1GB
$size_64k = $size_64k / 1GB
$size_else = $size_else / 1GB
$size_total = $size_total / 1GB

$pcount_1k = ($count_1k * 100) / $count_total
$pcount_4k = ($count_4k * 100) / $count_total
$pcount_16k = ($count_16k * 100) / $count_total
$pcount_32k = ($count_32k * 100) / $count_total
$pcount_64k = ($count_64k * 100) / $count_total
$pcount_else = ($count_else * 100) / $count_total


Write-Output "count_1k    = $count_1k - $pcount_1k" 
Write-Output "count_4k    = $count_4k - $pcount_4k" 
Write-Output "count_16k   = $count_16k - $pcount_16k" 
Write-Output "count_32k   = $count_32k - $pcount_32k" 
Write-Output "count_64k   = $count_64k - $pcount_64k" 
Write-Output "count_else  = $count_else - $pcount_else" 
Write-Output "count_total = $count_total"

Write-Output "size_1k    = $size_1k" 
Write-Output "size_4k    = $size_4k"
Write-Output "size_16k   = $size_16k"
Write-Output "size_total = $size_total"
