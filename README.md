# Lighthouse 1.0

Lighthouse is a plural tool for folks to track their alters, systems, and get access to resources. Built with ExpressJS, using EJS for templating and PostgreSQL for the database. With the recent shutdown of Simply Plural, Lighthouse's code is now being made public for the community to use and keep options alive for plural folks.

## A quick "Constitution" for Lighthouse
1. Personally Identifiable Information (PII) needs to be a bare minimum. Our userbase, while not exclusively, is made up of people who are vulnerable, in actively abusive situations, or are otherwise at risk. We want to minimize the amount of information that could be used to identify or locate our users. If your feature needs a name, an address, a demographic or a form of payment information, it will be rejected immediately.
2. Inclusivity needs to be a foundation in everything Lighthouse has. Not every plural system is the same. Some have no memories of trauma. Some have lots. Some have none at all. If someone has decided that Lighthouse will help them, we as the community are not in a position to deny that. 
3. Do not vibe code your features for Lighthouse. Security remains a risk with LLM-generated code, as well as copyright issues (it's still not decided who owns LLM-generated code). If we suspect LLM-generated code, we will ask you for understanding of the code and how it works. If you cannot provide that, your code will be rejected. This is important, as using vibe code will erode trust from users almost instantly.
4. Donations for now will not be accepted, since it'll get dicey about where the money goes. For now, Lighthouse will be paid for by The Lighthouse System. If donations become necessary, we'll probably appoint someone to handle the money and make it clear we're using the funds for what they're meant for.

## Set Up and Installation
Setting up Lighthouse is fairly straightforward. 

1. Clone the repository to your local machine.
2. Install all dependencies using `npm install`.
3. Create a `.env` file in the root directory. Add the following environment variables:
    - `cryptkey`: The key used for encrypting sensitive data. This should be a long, random string.
    - `DB_HOST`: The host of your PostgreSQL database.
    - `DB_USER`: The username for your PostgreSQL database.
    - `DB_PASS`: The password for your PostgreSQL database.
    - `DB_PORT`: The port for your PostgreSQL database.
    - `DB_NAME`: The name of your PostgreSQL database.
    - `dev1`, `dev2`, `dev3`: The IDs of users who should have access to development features (optional).
    - `environment`: Set this to `dev`. Since you won't have access to the live database, it will crash if you try to run it in production mode.
    - 