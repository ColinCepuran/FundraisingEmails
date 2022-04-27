# Fundraising Emails
 This repository collects and posts fundraising emails sent by major party candidates during the 2020 elections.

# Reading Fundraising Emails

First, we read in `Key.csv`, which includes identifying information about the major party candidates, and the text we use to identify their emails (usually some element of the "paid-for-by" bug).

Next, we use `MailHandler_COPY.R` to create several data files. This script unpacks the GMail archive of the emails we collected for this project, and makes minimal formatting changes for space and clarity.

From there, we merge the resulting dataframes together to create a number of files.

- `UnmatchedUncleaned.csv` The raw emails, unmatched, and largely uncleaned. Available on request due to size.
- `MatchedUncleaned.csv` We use the IDing text column in `Key.csv` to pair every email in our corpus with every candidate. However, each candidate's emails will include some text that is particular to only that candidate's emails (see above). This file includes only the candidates and emails whose IDing text "matched."
  - This data is the data we clean.

## Miscellaneous Notes, Coverage Errors, etc.

## Presidency



### Major-Party Coordinated

- To our knowledge, the NRCC did *not* send direct fundraising, communications, but rather established joint committees with other candidates (such as Lee Zeldin or John James)

### Senate

- We were not able to sign up for the following Senate candidates' emails: Murkowski, Tuberville, Shelby, Boozman, Feinstein, Gardner, Scott, Rubio, Ernst, Risch, Jordan, .
- Marco Rubio's campaign opt-in did not sign us up for campaign emails, and instead connected us to constituent services emails. While we include these in our database they are *not* party-political communications for electioneering purposes and should not be treated as such.
- Because the Democratic candidate in Alaska contested a primary alongside two minor party candidates and lost, we only signed up for the (successful) Republican Senate candidate's emails.
- Kamala Harris' last email sent by her Committee-to-Elect was sent on August 26, 2020, two weeks after she was nominated as Vice President.



## Summary

| **<u>Office</u>**       | **<u>In</u>** | **<u>Out</u>** |
| ----------------------- | ------------- | -------------- |
| Presidency              | 2             | 0              |
| Major-Party Coordinated | 5             | 0              |
| Senate                  | 19            | 8              |
| House                   |               |                |



# Joining to ICPSR IDs, Information about candidate, etc.

# Text Cleaning

Translating plain text characters to unicode text (and vice versa) meant that our text-processing frequently returned gibberish instead of a punctuation mark. Before cleaning and recoding text files, we note several points.

- Our ability to clean text easily varied across party, likely because candidates used different (related to partisanship) software to process emails.
- Also, plenty of candidates included plain text emails alongside their rich-text/html emails. These emails are far easier to analyze. When possible, we tried to specifically select this text.

This task is accomplished in `MailCleaner_COPY.R`

# Analysis

This, intuitively, is where we actually try to make sense of the emails we've pulled down.

For now, we include an in-progress replication file, `Analysis_COPY.R`