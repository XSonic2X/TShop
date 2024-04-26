
/*�������� �������*/
CREATE TABLE Categories(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE InformationProducts(
	[productsId] [int] NOT NULL,
	[�ategoriesId] [int] NOT NULL
) ON [PRIMARY]

CREATE TABLE Products(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
/*=======================================*/

/*��������� ������*/
ALTER TABLE InformationProducts  WITH CHECK ADD  CONSTRAINT [FK_InformationProducts_Categories] FOREIGN KEY([�ategoriesId])
REFERENCES Categories ([id])

ALTER TABLE InformationProducts  WITH CHECK ADD  CONSTRAINT [FK_InformationProducts_Products] FOREIGN KEY([productsId])
REFERENCES Products ([id])
/*===========================*/

/*���������� ������*/
insert Products values ('�������')
insert Products values ('����� � ����������')

insert Categories values ('����')
insert Categories values ('����')
insert Categories values ('�������')

insert InformationProducts values (1,1)
insert InformationProducts values (1,2)
insert InformationProducts values (2,2)
insert InformationProducts values (2,3)
/*=======================*/

/*�����*/
Select Products.name, Categories.name from Products Left join 
InformationProducts on id = productsId Left join 
Categories on Categories.id = InformationProducts.�ategoriesId
where (Products.name + Categories.name) like '%���%'