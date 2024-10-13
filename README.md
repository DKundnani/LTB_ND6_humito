<h1 align="center"> Variant calling and consensus sequence generation for mitochondrial samples (liver tissue biopsy)  </h1>

Wrapper bash script to be used with input fastq files, and customized script to ontain percent reads for the mutations in human mitochondria.

<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
-->
[![Commits][Commits-shield]][Commits-url]
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Website][website-shield]][website-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="##Installation">Installation</a></li>
      <ul>
        <li><a href="###Getting-the-code">Getting the code</a></li>
        <li><a href="###Dependencies">Dependencies</a></li>
      </ul>
    </li>
    <li><a href="##Usage">Usage</a></li>
      <ul>
        <li><a href="###Alignment-and-Variant-Calling">Alignment and Variant Calling</a></li>
        <li><a href="###Getting-ND6-gene-consensus-sequence-for-each-sample">Getting ND6 gene consensus sequence for each sample</a></li>
        <li><a href="###Getting-mutation-percentages-from-vcf">Getting mutation percentages from vcf</a></li>
      </ul>
    <li><a href="##Contributing">Contributing</a></li>
    <li><a href="##License">License</a></li>
    <li><a href="##Contact">Contact</a></li>
    <li><a href="##Citations">Citations</a></li>
  </ol>
</details>

<!-- Installation -->
## Installation
### Getting the code
The development version from [GitHub](https://github.com/) with:
```sh
git clone https://github.com/DKundnani/LTB_ND6_humito.git
```

### Additional Dependencies
* samtools
* BWA-MEM
* GATK
* bedtools
* bcftools
* fastq files pre trimmed with trim-galore
* Reference genome files (.fa and .fai) of the organism being used(Also used to generate bed files)

<!-- USAGE -->
## Usage
### Alignment and Variant Calling
```bash
#Update each of the following files before running with required directories and variables.
#Here we are aligning the trimmed fastq reads with BWA-mem and running two variant callers from GATK. HaplotypeCaller and Mutect2
bash alignment.sh
bash haplotypecaller.sh
bash mutect.sh
```
### Getting ND6 gene consensus sequence for each sample 
```bash
#Update each of the following files before running with required directories and variables.
#Here we are using bcftools to get consensus for patient genomes using vcf files (output of variant callers) and extracting ND6 region sequence using bedtools and bedfile of ND6 coordinate
bash consensus.sh
```
### Getting mutation percentages from vcf
```bash
#Here update the sample vcf to the outout vcf file name
bash vcftotsv.sh path/to/sample.vcf
```

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact
Deepali L. Kundnani - deepali.kundnani@gmail.com  [![LinkedIn][linkedin-shield]][linkedin-url]

Kirti Chhatlani - kirtichhatlani29@gmail.com
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Citations
* <b> Light-strand bias and enriched zones of embedded ribonucleotides are associated with DNA replication and transcription in the human-mitochondrial genome. </b>
Penghao Xu, Taehwan Yang, Deepali L Kundnani, Mo Sun, Stefania Marsili, Alli L Gombolay, Youngkyu Jeon, Gary Newnam, Sathya Balachander, Veronica Bazzani, Umberto Baccarani, Vivian S Park, Sijia Tao, Adriana Lori, Raymond F Schinazi, Baek Kim, Zachary F Pursell, Gianluca Tell, Carlo Vascotto, Francesca Storici
<i>  Acids Research </i> 2023;, gkad1204, [https://doi.org/10.1093/nar/gkad1204](https://doi.org/10.1093/nar/gkad1204)
* <b> Distinct features of ribonucleotides within genomic DNA in Aicardi-Goutières syndrome (AGS)-ortholog mutants of <i>Saccharomyces cerevisiae</i> </b>
Deepali L. Kundnani, Taehwan Yang, Alli L. Gombolay, Kuntal Mukherjee, Gary Newnam, Chance Meers, Zeel H. Mehta, Celine Mouawad, Francesca Storici
bioRxiv 2023.10.02.560505; doi:[https://doi.org/10.1101/2023.10.02.560505]( https://doi.org/10.1101/2023.10.02.560505)
* Kundnani, D. (2024). rNMP_hotspots:2.0.0 (2.0.0). Zenodo.  [https://doi.org/10.5281/zenodo.8152090](https://doi.org/10.5281/zenodo.8152090) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.8152090.svg)](https://doi.org/10.5281/zenodo.8152090)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/DKundnani/LTB_ND6_humito?style=for-the-badge
[contributors-url]: https://github.com/DKundnani/LTB_ND6_humito/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/DKundnani/LTB_ND6_humito?style=for-the-badge
[forks-url]: https://github.com/DKundnani/LTB_ND6_humito/forks
[stars-shield]: https://img.shields.io/github/stars/DKundnani/LTB_ND6_humito?style=for-the-badge
[stars-url]: https://github.com/DKundnani/LTB_ND6_humito/stargazers
[issues-shield]: https://img.shields.io/github/issues/DKundnani/LTB_ND6_humito?style=for-the-badge
[issues-url]: https://github.com/DKundnani/LTB_ND6_humito/issues
[license-shield]: https://img.shields.io/github/license/DKundnani/LTB_ND6_humito?style=for-the-badge
[license-url]: https://github.com/DKundnani/LTB_ND6_humito/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/deepalik
[product-screenshot]: images/screenshot.png
[commits-url]: https://github.com/DKundnani/LTB_ND6_humito/pulse
[commits-shield]: https://img.shields.io/github/commit-activity/t/DKundnani/LTB_ND6_humito?style=for-the-badge
[website-shield]: https://img.shields.io/website?url=http%3A%2F%2Fdkundnani.bio%2F&style=for-the-badge
[website-url]:http://dkundnani.bio/ 
