class OtherProject {
  final String name;
  final String description;
  final String image;
  final String url;
  final List<String> skills;

  OtherProject({this.name, this.description, this.image, this.url, this.skills});
}

List<OtherProject> OTHER_PROJECTS = [
  // nQuran Extractor
  OtherProject(
    name: "nQuran Extractor",
    description:
        "A script that extracts the pages of the Holy Quran in different (قراءات) from the famous website nQuran. For security reasons the website splits each page into 3 images and encrypts the path for each image. I managed to decrypt the URL paths and wrote this script which encodes the URL paths and extracts the images from the website and merges the 3 images for each page into one single image and saves it to local storage.",
    url: "https://github.com/DevYahia/python-projects/blob/main/nquran_extractor.py",
    skills: ["Pyhton", "PIL"],
  ),
  // Marks Plotter
  OtherProject(
    name: "Marks Plotter",
    description:
        "A script that was written to convert the pdf file the faculty of medicine in JU sends to a plotted graph.",
    url: "https://github.com/DevYahia/python-projects/blob/main/marks_graph_plotter.py",
    skills: ["Pyhton", "numpy", "tabula", "seaborn", "matplotlib"],
  ),
];
