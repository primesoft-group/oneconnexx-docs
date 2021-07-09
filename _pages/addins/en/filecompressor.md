---
layout: page
title: FileCompressor
permalink: "addins/en/filecompressor/"
language: en
---

The FileCompressor Add-In compresses certain files from a certain directory and then saves them in an archive.<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | In/Out: file directory |
| Transactions | 	1 if successful |
| Events | &lt;Instance&gt;.Done (parameter = file) |
| | |
| __parameter__ | |
| sourceDirectory | Directory of the source file (s) |
| sourceFilePattern | The file pattern is used to restrict the source files (* = everything; e.g. « .txt» => all files with the extension .txt)<br />Several patterns are separated by semicolons. Ex. « .Txt; * .xml »=> all text and XML files. |
| archiveName | File name (including directory) of the archive. The input {0} is used as a placeholder for the current date. E.g. {0: yyyyMMdd} .zip => 20161128.zip. |
| archiveType | 	Archive file type: Zip, Tar or GZip. (Default = "Zip") |
| compressionType | Compression type depending on the type of archive (default = "LZMA")::<br />- Zip => BZip2, PPMd, Deflate, LZMA<br />- Tar => GZip, BZip2<br />- GZip => GZip. |
| deleteSourceAfterProcessing | true = The source files will be deleted after compression. (Optional, default = false) |
| endpoint | Name of the endpoint that is used in the transaction (optional, default = "") |

### Application examples

Space-saving archiving of any user data
