f <- "Ghana-Population-Population-2026-02-02-12-35.csv"

tbl <- read.table(f, sep=",", header=TRUE, nrow=-1)
colnames(tbl) <- c("year", "population")
dim(tbl)
head(tbl)
plot(tbl$year, tbl$population)

f <- "highSchoolData.csv"
tbl.hs <- read.table(f, sep=",", header=TRUE, nrow=-1)
tbl.hs <- subset(tbl.hs, country=="Ghana")
dim(tbl.hs)   # 1852 89
as.data.frame(t(tbl.hs[1:2,]))
head(colnames(tbl.hs))

coi <- c("year", "comp_prim_v2_m", "comp_upsec_2029_m")
dim(tbl.hs[, coi])
head(tbl.hs[, coi])

subset(tbl.hs, wealth=="Quintile_1")[, coi]

tbl.completion <- subset(tbl.hs, wealth=="Quintile 1")[, coi]
colnames(tbl.completion) <- c("year", "primary", "secondary")
dim(tbl.completion)
#tbl.completion <- subset(tbl.completion, !is.na(primary) & !is.na(secondary))
tbl.completion <- subset(tbl.completion, !is.na(primary))
new.order <- order(tbl.completion$year)
tbl.completion <- tbl.completion[new.order,]

years <- sort(unique(tbl.completion$year))


tbl.sum <- data.frame(year=years, primary=0, secondary=0)
primaries <- c()
secondaries <- c()

for(Year in years){
   primaries <- c(primaries, mean(subset(tbl.completion, year==Year)$primary))
   secondaries <- c(secondaries, mean(subset(tbl.completion, year==Year)$secondary, na.rm=TRUE))
   }

tbl.sum$primary  <- primaries
tbl.sum$secondary <- secondaries

write.table(tbl.sum, file="completions.csv", sep=",", row.names=FALSE, col.names=TRUE)
