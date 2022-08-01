CREATE TABLE "public.users" (
	"id" serial NOT NULL UNIQUE,
	"name" TEXT(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"secondaryImage" integer,
	"mainImage" TEXT NOT NULL,
	"categoryId" integer NOT NULL,
	"sizeId" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.images" (
	"id" serial NOT NULL,
	"image" TEXT NOT NULL,
	CONSTRAINT "images_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"category" TEXT NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"size" TEXT NOT NULL UNIQUE,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sales" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"productId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"saleDate" DATE NOT NULL,
	"addressId" serial NOT NULL,
	"status" TEXT NOT NULL,
	CONSTRAINT "sales_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.address" (
	"id" serial NOT NULL,
	"street" TEXT NOT NULL,
	"number" int NOT NULL,
	"complement" TEXT,
	"district" TEXT NOT NULL,
	"city" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	"userId" integer NOT NULL,
	CONSTRAINT "address_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("secondaryImage") REFERENCES "images"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("sizeId") REFERENCES "sizes"("id");




ALTER TABLE "sales" ADD CONSTRAINT "sales_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "sales" ADD CONSTRAINT "sales_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "sales" ADD CONSTRAINT "sales_fk2" FOREIGN KEY ("addressId") REFERENCES "address"("id");

ALTER TABLE "address" ADD CONSTRAINT "address_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");








