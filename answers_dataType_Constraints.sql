CREATE TABLE customers (
	id SERIAL PRIMARY KEY, 
	"fullName" VARCHAR(50) NOT NULL, 
	cpf VARCHAR(11) NOT NULL UNIQUE, 
	email TEXT NOT NULL UNIQUE, 
	password INTEGER NOT NULL
);

CREATE TABLE "bankAccount" (
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES customers(id),
	"accountNumber" TEXT NOT NULL UNIQUE, 
	agency TEXT NOT NULL UNIQUE,
	"openDate" DATE NOT NULL DEFAULT NOW(),
	"closeDate" DATE
);

CREATE TABLE transactions (
	id SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"(id),
	amount INTEGER NOT NULL,
	type TEXT NOT NULL,
	time DATE NOT NULL DEFAULT NOW(),
	description TEXT,
	cancelled BOOL NOT NULL DEFAULT 'false'
);

CREATE TABLE "creditCards" (
	id SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"(id),
	name TEXT NOT NULL,
	number TEXT NOT NULL UNIQUE,
	"securityCode" TEXT NOT NULL UNIQUE,
	"expirationMonth" DATE NOT NULL,
	"expirationYear" DATE NOT NULL,
	password TEXT NOT NULL,
	"limit" INTEGER NOT NULL
);

CREATE TABLE states (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL UNIQUE
);

CREATE TABLE cities (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL UNIQUE,
	"stateId" INTEGER NOT NULL REFERENCES states(id)
);

CREATE TABLE "customerAddresses" ( 
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL UNIQUE REFERENCES customers(id),
	street TEXT NOT NULL,
	number TEXT NOT NULL,
	complement TEXT,
	postalCode TEXT NOT NULL,
	cityId INTEGER NOT NULL REFERENCES cities(id)
);

CREATE TABLE "customerPhones" (
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES customers(id),
	number TEXT NOT NULL,
	type TEXT
);
