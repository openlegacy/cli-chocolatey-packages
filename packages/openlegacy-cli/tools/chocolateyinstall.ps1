﻿$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://ol-public-artifacts.s3.amazonaws.com/openlegacy-cli/1.5.0/windows/install_windows.zip' # download url, HTTPS preferred


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'  # 'EXE_MSI_OR_MSU' #only one of these: exe, msi, msu
  url           = $url


  softwareName  = 'openlegacy-cli*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum      = '14146f925382108a4cd5a9035a30b9234e4982a7d1d5aa2787dd7dee47863342'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
}

Install-ChocolateyZipPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-zip-package
Install-ChocolateyPath "$toolsDir/ol/bin" 'Machine' # Machine will assert administrative rights
