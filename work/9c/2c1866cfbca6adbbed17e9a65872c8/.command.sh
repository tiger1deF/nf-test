#!/bin/bash -ue
def extractProteinsFromCSVs(inputDir) {
    def proteinsList = []
    def csvFiles = fileTree(inputDir).include("**/*.csv")

    csvFiles.each { file ->
        def lines = file.readLines().drop(1)
        lines.each { line ->
            def columns = line.split(",")
            // Check if the column header is "proteins" (case-insensitive)
            if (columns[0].trim().equalsIgnoreCase("proteins")) {
                columns.drop(1).each { protein -> proteinsList.add(protein.trim()) }
            }
        }
    }
    return proteinsList
}

def proteinsList = extractProteinsFromCSVs("data")
def proteinsChannel = file("output/proteins.txt")
proteinsChannel.write(proteinsList.join("\n"))
proteins_channel = file(proteinsChannel)
