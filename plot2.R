# Read data files
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in Baltimore City, Maryland from
# 1999 to 2008?
bmore.emissions <- NEI[NEI$fips=="24510",]
# group emissions by year
bmore.emissions.by.year <- aggregate(Emissions ~ year, bmore.emissions, sum)

png('plot2.png')
barplot(height=bmore.emissions.by.year$Emissions,
        names.arg=bmore.emissions.by.year$year,
        xlab="years", ylab=expression('total PM'[2]*' emission'),
        main=expression('Total PM'[2]*' emissions in Baltimore City, '*
                                'Maryland at various years'))
dev.off()