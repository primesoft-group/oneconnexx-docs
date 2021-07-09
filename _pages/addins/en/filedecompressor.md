---
layout: page
title: FileDecompressor
permalink: "addins/en/filedecompressor/"
language: en
---

The FileDecompressor Add-In unpacks Zip, GZip, or Tar files<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | In/Out: file directory |
| Transactions | 1 per created file |
| Events | Per created file: &lt;instanz&gt;.Output (parameter = file)<br /> &lt;instance&gt;.Done |
| | |
| __parameter__ | |
| sourceDirectory | Source directory with the compressed files |
| sourceFilePattern | The file pattern is used to restrict the number of compressed files<br /> \* = all; «\*.zip» => all ZIP files<br />? = unsure of the name of the file. E.g. «1?.zip» => all ZIP files which contain at least a 1. <br />Multiple patterns are separated with semicolons. Ex. «\*.Zip; \*.tar» => all ZIP and TAR files |
| destinationDirectory | 	Target directory where the files will be extracted |
| archivePassword | 	For automatic unpacking of password-protected archives (optional) |
| deleteSourceAfterProcessing | true = The compressed file is deleted after unpacking (default = false) | 
| decompressToSubFolder | true = The files are extracted to a subdirectory with the same name as the archive <br /> false = The files are extracted directly to the target directory (Default = false)|
| endpoint | Name of the endpoint that is used in the transaction (optional, default = "") |

<!-- 
### Anwendungsbeispiele 

ToDo
-->

