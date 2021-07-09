---
layout: page
title: FileCopy
permalink: "addins/en/filecopy/"
language: en
---

The FileCopy Add-In is used to copy files from one system to another. A wide variety of transmission protocols are supported.<br /><br />

{:.table .table-striped}
| --- | --- |
| features | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | In/Out: Dateiverzeichnis |
| Transactions | 1 pro kopierte Datei |
| Events | Per copied file if target = FILE:  &lt;instance&gt;.Output (Parameter = file)<br />&lt;instance&gt;.Done<br />&lt;instance&gt;.Filter (Parameter = file, see application examples) |
| | |
| __parameter__ | |
| sourceProtocol | The protocol to use to read the source files. The choices are: NULL, FILE, FTP, FTPS, SFTP, S3, WebDAV and SHAREPOINT |
| sourceSystem | Depending on "sourceProtocol"<br />FILE: leave blank<br/>FTP, FTPS, SFTP and WebDAV: IP or host name of the source system <br />S3: RegionEndPoint if not *EUWest1* <br /> SHAREPOINT: URL to the target document library on Sharepoint (without any sub-folders). The part after the last '/' of the URL must correspond to the name of the document library (with special characters if necessary). |
| sourcePath | Depending on "sourceProtocol"<br />FILE: UNC path to the source files<br />WebDAV: URL of the source files<br />FTP, FTPS, SFTP: Relative path<br /> S3: Bucket name <br /> SHAREPOINT: Optionally the relative path of the source document library including subdirectory. With Sharepoint Online this is, for example, "/ sites / Sitename / Released documents / Subfolders".|
| sourceArchivePath | Directory (for format see "sourcePath") to which successfully copied files are additionally moved (optional) |
| sourceTimeFilter | FILE, SFTP, SHAREPOINT: Time filter to only process files that are older than the set time (in minutes) |
| destinationFileName | Name of the copied files on the target system, if they should have a different name than the original files. Possible placeholders: <br /> {0}: Name of the original file without extension <br /> {1}: Extension of the original file <br /> {2}: Current time. Default format = yyyyMMddHHmmss |
| destinationProtocol | The protocol to use to write the target files. The choices are: NULL, FILE, FTP, FTPS, SFTP, S3, WebDAV and SHAREPOINT |
| destinationSystem | Abhängig von "destinationProtocol"<br />FILE: leave blank<br/>FTP, FTPS, SFTP and WebDAV: IP or host name of the target system <br />S3: RegionEndPoint if not *EUWest1* <br /> SHAREPOINT: URL to the target document library on Sharepoint (without any sub-folders). The part after the last '/' of the URL must correspond to the name of the document library (with special characters if necessary). |
| destinationPath | Depending on "destinationProtocol"<br />FILE: UNC path of the destination directory<br/>S3: Bucketname<br /> SHAREPOINT: Optionally the relative path of the destination document library including subdirectory. With Sharepoint Online this is, for example, "/ sites / Sitename / Released documents / Subfolders". |
| filePattern | Search pattern of the files to be copied<br />The placeholders * and? can be used as usual with Windows. Several search patterns can be specified separated by semicolons. Example: "* .txt; *. Xml" => all text and XML files. |
| moveFiles | 	true = files are moved, i.e. deleted on the source system.<br />false = files are copied and remain on the source system. |
| skipExistingFiles | If 'true', copied files are not deleted from the temp directory and files that already exist in the temp directory are skipped. |
| sourceUserName | User for access to the source system (optional) |
| sourcePassword | Associated password (optional) |
| destUserName | User for access to the target system (optional) |
| destPassword | Associated password (optional) |
| tempDirectory | Files are stored locally in this directory during a copy process. (Optional, default = system temp directory) |
| endpoint | Name of the end point that is used in the transaction (optional, default = "") |


### Application examples

The FileCopy Add-In is used for automatic exchange with FTP servers but also for automatic synchronization within the company network. 
The FileCopy Add-In is very versatile thanks to the possibilities of archiving and moving, as well as the support of many protocols.

##### Add timestamp

If all copied files on the target system are to be provided with a time stamp, this can be implemented using the "destinationFileName" parameter with the value "{0} _ {2: yyyyMMdd_HHmmss}. {1}").

*Example:* A "test.txt" file becomes "test_20170524_094825.txt" on the target system

##### NULL protocol

The NULL transfer protocol can be used as "destinationProtocol" if only the existence of a file on the source system is to be checked. This protocol does not copy any files, but a transaction is still written for every file found on the source system, which can then be monitored by a rule.

##### Source file via "file" parameter

If the FileCopy Add-In is activated via an event that contains a "file" parameter, the file in this parameter is interpreted as a source file and copied to the target system. In this case the configured parameters "sourcePath" and "filePattern" are ignored.

Events with "file" parameters are triggered by the following add-ins:
* DatabaseToCSV
* FileDecompressor
* FileCompressor
* FileCopy
* FileReconstructor
* FileSystemWatcher
* Ldap2CSV
* Xml2Csv

##### Using the "Filter" event

The "Filter" event is triggered after the FileCopy instance has copied a file from the source system into the temporary directory. The "file" parameter points to the file to be copied in the temporary directory. If another add-in has subscribed to this event, the FileCopy instance waits with copying to the target system until the other add-in has finished processing the event. In combination with the "TextReplace" add-in, a file can be copied from A to B and converted at the same time.

##### Using the "skipExistingFiles" parameter

The 'skipExistingFiles' parameter can be set to 'true' if files on the source system cannot be deleted or moved, but only newly added files are to be copied. Files are not deleted from the local temporary directory after copying, and files that already exist in the local temporary directory are skipped. If this option is used, 'tempDirectory' should be set to a directory that is used exclusively for this purpose.
