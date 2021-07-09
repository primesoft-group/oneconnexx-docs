---
layout: page
title: FileReconstructor
permalink: "addins/en/filereconstructor/"
language: en
---

The FileReconstructor Add-In reads an existing file, reforms the content line by line based on configured rules and writes the reconstructed lines to a new file.<br /><br />

{:.table .table-striped}
| --- | --- |
| __features__ | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |
| Add-in type | Logic |
| Interfaces | In/Out: Dateieverzeichnis |
| Transactions | 1 pro erstellte Datei |
| Events | Per created file: &lt;Instance&gt;.Output (parameter = file) <br />&lt;Instance&gt;.Done |
| | |
| __parameter__ | |
| inputFile | Source file including directory. Multiple files possible (optional) |
| reconfiguration | Conversion rules applied line by line.<br />1. Reference to the original line: curly brackets in the format {index start character, index end character, [text length], [padding character], [horizontal alignment]}<br />&nbsp;&nbsp; a. If the text length is not specified, it is calculated on the end and start index.<br />&nbsp;&nbsp;  b. If no end index is specified, this is calculated on the basis of the start index and the text length.<br />&nbsp;&nbsp;c. If the end index is outside the actual line length, the index of the last character in the line is used.<br />&nbsp;&nbsp;d. If the text length is greater than the difference between the end and start index, the padding character is used (default = space).<br />&nbsp;&nbsp;e. The padding character is inserted on the right or left depending on the alignment ('left' / 'l' (standard) or 'right' / 'r').<br />2. Fix Text: Enter in single quotation marks (') or quotation marks (") |
| outputFile | Target file. Placeholder: <br /> {now}: Current date<br />	{file}: Filename of the input file |
| outputPath | Target directory (optional, default = "") |
| deleteInputFile | 	true = source file will be deleted (optional, default = false) |
| userName | Users with the necessary permissions for the target file (Optional) |
| password | Associated password (optional) |
| endpoint | Name of the endpoint that is used in the transaction (optional, default = "") |


### Application examples

#### Source file with fixed column width -> target file CSV:
The input file contains columns with a fixed width, the content is as follows:<br />
<span style="font-family:Courier;">EUR1000&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CHF1072<br />EUR400&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;USD430</span>

The output file should consist of 6 columns separated by semicolons; Fill spaces for EUR with ∗:<br />TO;CHF;&lowast;&lowast;1072;FROM;EUR;1000<br />TO;USD;&lowast;&lowast;&lowast;430;FROM;EUR;400<br />

A possible configuration looks like this: __'TO;'{12,,3}';'{15,21,,&lowast;,r}';FROM;'{0,3}';'{3,9}__<br /> - 'TO;' = fixer Text<br /> - {12,,3} = 3 characters are copied from position 12 (e.g. CHF)<br /> - ';' = fixed text (semicolon)<br /> - {15,21,,*,r} = copy position 15 to 21 and fill it with ∗ on the left side (because alignment = right) (e.g. ∗∗ 1072)<br /> - ';FROM;' = fixed text<br /> - {0,3} = 3 characters are copied from position 0 (e.g. EUR)<br /> - ';' = fixed text (Semicolon)<br /> - {3,9} = copy positions 3 to 9
