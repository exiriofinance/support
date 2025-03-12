# Connect to Interactive Brokers (IB)

**Given all the complications with the previous connectivity provider, we recommend you select "Connect European Institution" when connecting Interactive Brokers, even if your account with IB is in the USA.**

**In order for it to work, and for security reasons, you must have activated second factor authentication with IB, what they call IB Key. You can find the instructions [here](https://ibkr.info/node/2260).**

To connect Interactive Brokers (IB) to Exirio and enable all the metrics in your account, you need to configure a Flex Query within IB. The process should take between 2 and 5 minutes; if you have any trouble with this process, please drop us an email at support@exirio.com and we will be happy to help.

## Enabling the connection in IB

1. Log into Interactive Brokers
   1. Log into you Interactive Brokers Account Management
   1. [https://www.interactivebrokers.com/sso/Login](https://www.interactivebrokers.com/sso/Login)

![IB Login](https://s3-eu-central-1.amazonaws.com/euc-cdn.freshdesk.com/data/helpdesk/attachments/production/80033708015/original/L_ApCUR0Lko7knzqx6zlPMQynJoohsk0Tw.png?1630397206)

2. Activate Flex Web Services
   1. On the top right of the screen, select "Manage Account"

![Manage Account](https://s3-eu-central-1.amazonaws.com/euc-cdn.freshdesk.com/data/helpdesk/attachments/production/80033709753/original/yn-x9o5Wd-d7l9w99nQfCqXP0gHNlOO9yQ.png?1630397431)

   2. Scroll down and on the right you will find the section "Reporting", click on "Configure".

![Reporting Configure](https://s3-eu-central-1.amazonaws.com/euc-cdn.freshdesk.com/data/helpdesk/attachments/production/80033708799/original/EWaZWPNtjjbwbBCxpbTzrPpMJTBh3IvC2Q.png?1630397314)

   3. Click the box to enable the Flex Web Service.

![Enable Flex Web Service](https://s3-eu-central-1.amazonaws.com/euc-cdn.freshdesk.com/data/helpdesk/attachments/production/80033718126/original/jL9mIpwXTMTqWdodkjc3J8MFdA9wAzkGDw.png?1630398529)

   4. Copy/Paste the Token somewhere else, you will need it later.

![Token](https://s3-eu-central-1.amazonaws.com/euc-cdn.freshdesk.com/data/helpdesk/attachments/production/80033718408/original/HzZoBa378_Cig2OCVEu_1mTB4v_BpbqS9w.png?1630398566)

**Note that the Token has an expiry date, after which you will need to come back here and generate a new one to keep the connection alive.**

3. Create Flex Query
   1. On the top menu, click on Reports-Flex Queries.

![Reports Flex Queries](https://s3-eu-central-1.amazonaws.com/euc-cdn.freshdesk.com/data/helpdesk/attachments/production/80028603365/original/xRk8s7CLQ6k0fWsgNOFBCqRJx_QkpcMkiw.png?1628279701)

   2. Click on the '+' "Create" button in Activity Flex Query.

![Create Flex Query](https://s3-eu-central-1.amazonaws.com/euc-cdn.freshdesk.com/data/helpdesk/attachments/production/80028603447/original/1pxXzP97x-_Tn0AGSOt97u0xSL0YwFUOVw.png?1628279783)

   3. Enter a name for the new Query, e.g. Exirio

![Query Name](https://s3-eu-central-1.amazonaws.com/euc-cdn.freshdesk.com/data/helpdesk/attachments/production/80034839690/original/PLwT3Y1OQN7y20uB8YiqSyse5QfB5ynzXA.png?1630841058)

   4. Select the information that will be contained in the Query

Select the following Sections. When a dialog box asks you to choose details within those sections, just select everything with "Select All". >

- Account Information
- Cash Report
- Cash Transactions
- Open Positions
- Trades

![Query Sections](https://s3-eu-central-1.amazonaws.com/euc-cdn.freshdesk.com/data/helpdesk/attachments/production/80028603547/original/d3kqMZFzJNk4Fl_UqACp86K5dsObk8LcYQ.png?1628280009)

In Delivery Configuration:

- Select Period: Last 365 Calendar Days.
- Leave everything else with the default option.

![Delivery Configuration](https://s3-eu-central-1.amazonaws.com/euc-cdn.freshdesk.com/data/helpdesk/attachments/production/80028603784/original/UG7koi5Kkkj31FIGwVq-6ZiUjoGy1Z0icg.png?1628280250)

Once you have selected all the required options, click "Continue", "Create" and "OK".

3.5. Get and copy the Flex Query
Back on the main page of Activity Flex Query, click on the 'i' info button.

![Info Button](https://s3-eu-central-1.amazonaws.com/euc-cdn.freshdesk.com/data/helpdesk/attachments/production/80028603860/original/bxYLZqvDjadZpQNiNWupMGBuurPy5MoNnw.png?1628280420)

Copy/Write down the Query ID, you will need it later. Close the window clicking on the X on the top right.

![Query ID](https://s3-eu-central-1.amazonaws.com/euc-cdn.freshdesk.com/data/helpdesk/attachments/production/80035398845/original/-VSeEJDbUx5-SlXLFICADUVGcpgrwOWevQ.png?1631023193)

4. Log into Exirio and enter those details
   1. Add Holding and enter the details

Finally, return to the Exirio app, click on the Add Holding + button, select "Connect external institution" (you might have reached these instructions from there already) and follow the screens to select Interactive Brokers and enter your details: username, password, Query ID (the one you have created in step 3) and Token (the one you have copied in step 2).

Your Interactive Brokers data will now synchronize and appear in Exirio.

   2. Further optional configuration

Please note that due to current limitations of the Interactive Brokers and Plaid API, if you want to have a full view of your investments you have to manually input/edit:

- Transactions older than 1 year (if any). Exirio creates a balancing Transaction with date 1 year ago that you can edit if the Transaction happened further in the past. Or add several Transactions if there is more than one.
- Cash positions (if substantially different from zero). At the moment IB does not send cash positions to Exirio and you will have to add them manually.