#!/usr/bin/perl -w

#
# This is a SAS Component
#

#
# Copyright (c) 2003-2006 University of Chicago and Fellowship
# for Interpretations of Genomes. All Rights Reserved.
#
# This file is part of the SEED Toolkit.
#
# The SEED Toolkit is free software. You can redistribute
# it and/or modify it under the terms of the SEED Toolkit
# Public License.
#
# You should have received a copy of the SEED Toolkit Public License
# along with this program; if not write to the University of Chicago
# at info@ci.uchicago.edu or the Fellowship for Interpretation of
# Genomes at veronika@thefig.info or download a copy from
# http://www.theseed.org/LICENSE.TXT.
#

#
# Given the output of assign_using_ff_server --otu, determine the domain, genus, and
# species of the organism.
#

use strict;
use Data::Dumper;
#use Pod::Usage;

=head1 identify_organisms Script

=head2 Introduction

    identify_organisms

Determine the organism for a set of calls.

This script take sthe output of assign_using_ff_server, assuming the last column is the
OTU (genome name) of the call. Determine the organism with the most hits, and print the
full name, genus, species, and domain as a tab-delimited line.


=cut

my %genus_map = map { chomp; my($genus, $domain) = split(/\t/);  $genus => $domain } <DATA>;

my %hits;

while (<>)
{
    chomp;
    my @a = split(/\t/);
    my $org = $a[$#a];
    $hits{$org}++ if defined($org);
}

my @s = sort { $hits{$b} <=> $hits{$a} } keys %hits;
for my $hit (@s)
{
    my @x = split(/\s+/, $hit);
    next unless exists $genus_map{$x[0]};
    print join("\t", $hit, $x[0], $x[1], $genus_map{$x[0]}), "\n";
}

__DATA__
Acanthamoeba	Eukaryota
Acetobacter	Bacteria
Achromobacter	Bacteria
Acidianus	Archaea
Acidiphilium	Bacteria
Acidithiobacillus	Bacteria
Acidobacteria	Bacteria
Acidothermus	Bacteria
Acidovorax	Bacteria
Acinetobacter	Bacteria
Acinonyx	Eukaryota
Acipenser	Eukaryota
Acropora	Eukaryota
Actinobacillus	Bacteria
Adiantum	Eukaryota
Aeromonas	Bacteria
Aeropyrum	Archaea
Ageratum	Virus
Agrobacterium	Bacteria
Akkermansia	Bacteria
Albinaria	Eukaryota
Albula	Eukaryota
Alcanivorax	Bacteria
Aldrovandia	Eukaryota
Alepocephalus	Eukaryota
Alkalilimnicola	Bacteria
Alkaliphilus	Bacteria
Alligator	Eukaryota
Allocyttus	Eukaryota
Allomyces	Eukaryota
Alteromonas	Bacteria
Amborella	Eukaryota
Ambystoma	Eukaryota
Amia	Eukaryota
Anabaena	Bacteria
Anaeromyxobacter	Bacteria
Anaplasma	Bacteria
Ancylostoma	Eukaryota
Andrias	Eukaryota
Anguilla	Eukaryota
Anomalopteryx	Eukaryota
Anopheles	Eukaryota
Anoplogaster	Eukaryota
Anser	Eukaryota
Antheraea	Eukaryota
Anthoceros	Eukaryota
Antigonia	Eukaryota
Aphredoderus	Eukaryota
Apis	Eukaryota
Aplysia	Eukaryota
Apteronotus	Eukaryota
Apteryx	Eukaryota
Aquifex	Bacteria
Arabidopsis	Eukaryota
Arbacia	Eukaryota
Arcanobacterium	Bacteria
Archaeoglobus	Archaea
Arcos	Eukaryota
Arctocephalus	Eukaryota
Arctoscopus	Eukaryota
Arenaria	Eukaryota
Artemia	Eukaryota
Artibeus	Eukaryota
Ascaris	Eukaryota
Aster	Bacteria
Asterina	Eukaryota
Ateleopus	Eukaryota
Atropa	Eukaryota
Aulopus	Eukaryota
Aurantimonas	Bacteria
Auxis	Eukaryota
Aythya	Eukaryota
Azoarcus	Bacteria
Azotobacter	Bacteria
Bacillus	Bacteria
Bacteriovorax	Bacteria
Bacteroides	Bacteria
Bactrocera	Eukaryota
Balaena	Eukaryota
Balaenoptera	Eukaryota
Balanoglossus	Eukaryota
Bartonella	Bacteria
Bassozetus	Eukaryota
Bathylagus	Eukaryota
Bdellovibrio	Bacteria
Berardius	Eukaryota
Beryx	Eukaryota
Beta	Eukaryota
Bifidobacterium	Bacteria
Biomphalaria	Eukaryota
Birmingham	Plasmid
Blastopirellula	Bacteria
Blochmannia	Bacteria
Blumeria	Eukaryota
Bombyx	Eukaryota
Bordetella	Bacteria
Borrelia	Bacteria
Bos	Eukaryota
Bradyrhizobium	Bacteria
Branchiostoma	Eukaryota
Brassica	Eukaryota
Brevibacillus	Bacteria
Brevibacterium	Bacteria
Brucella	Bacteria
Brugia	Eukaryota
Buchnera	Bacteria
Bufo	Eukaryota
Burkholderia	Bacteria
Buteo	Eukaryota
Butyrivibrio	Bacteria
Caelorinchus	Eukaryota
Caenolestes	Eukaryota
Caenorhabditis	Eukaryota
Cafeteria	Eukaryota
Caiman	Eukaryota
Caldicellulosiruptor	Bacteria
Caldivirga	Archaea
Calycanthus	Eukaryota
Campylobacter	Bacteria
Candida	Eukaryota
Canis	Eukaryota
Caperea	Eukaryota
Capra	Eukaryota
Carangoides	Eukaryota
Caranx	Eukaryota
Carapus	Eukaryota
Carassius	Eukaryota
Carboxydothermus	Bacteria
Carios	Eukaryota
Carpiodes	Eukaryota
Carsonella	Bacteria
Casuarius	Eukaryota
Cataetyx	Eukaryota
Caulobacter	Bacteria
Caulophryne	Eukaryota
Cavia	Eukaryota
Cebus	Eukaryota
Cellulophaga	Bacteria
Cepaea	Eukaryota
Ceratitis	Eukaryota
Ceratotherium	Eukaryota
Cetostoma	Eukaryota
Chaetosphaeridium	Eukaryota
Chalceus	Eukaryota
Chalinolobus	Eukaryota
Chanos	Eukaryota
Chara	Eukaryota
Chauliodus	Eukaryota
Chaunax	Eukaryota
Chelonia	Eukaryota
Chilli	Virus
Chimaera	Eukaryota
Chlamydia	Bacteria
Chlamydomonas	Eukaryota
Chlamydophila	Bacteria
Chlorella	Eukaryota
Chlorobium	Bacteria
Chlorochromium	Bacteria
Chloroflexus	Bacteria
Chlorophthalmus	Eukaryota
Chondrus	Eukaryota
Choristoneura	Virus
Chromobacterium	Bacteria
Chromohalobacter	Bacteria
Chrysemys	Eukaryota
Chrysochloris	Eukaryota
Chrysodidymus	Eukaryota
Chrysomya	Eukaryota
Ciconia	Eukaryota
Ciona	Eukaryota
Citrobacter	Bacteria
Clavibacter	Bacteria
Clostridium	Bacteria
Cobitis	Eukaryota
Cochliomyia	Eukaryota
Cololabis	Eukaryota
Colwellia	Bacteria
Comamonas	Bacteria
Conger	Eukaryota
Cooperia	Eukaryota
Coregonus	Eukaryota
Corvus	Eukaryota
Corydoras	Eukaryota
Corynebacterium	Bacteria
Cottus	Eukaryota
Coturnix	Eukaryota
Coxiella	Bacteria
Crassostrea	Eukaryota
Crenimugil	Eukaryota
Crioceris	Eukaryota
Croceibacter	Bacteria
Crocosphaera	Bacteria
Crossostoma	Eukaryota
Cryphonectria	Eukaryota
Cryptococcus	Eukaryota
Cupriavidus	Bacteria
Cyanidioschyzon	Eukaryota
Cyanidium	Eukaryota
Cyanophora	Eukaryota
Cyanothece	Bacteria
Cynocephalus	Eukaryota
Cyprinus	Eukaryota
Cytophaga	Bacteria
Dactyloptena	Eukaryota
Dallia	Eukaryota
Danacetichthys	Eukaryota
Danio	Eukaryota
Daphnia	Eukaryota
Dasypus	Eukaryota
Dechloromonas	Bacteria
Dehalococcoides	Bacteria
Deinococcus	Bacteria
Delftia	Bacteria
Desulfitobacterium	Bacteria
Desulfococcus	Bacteria
Desulforudis	Bacteria
Desulfotalea	Bacteria
Desulfotomaculum	Bacteria
Desulfovibrio	Bacteria
Desulfuromonas	Bacteria
Diaphus	Eukaryota
Dichelobacter	Bacteria
Dictyostelium	Eukaryota
Didelphis	Eukaryota
Dinodon	Eukaryota
Dinornis	Eukaryota
Dinoroseobacter	Bacteria
Diplacanthopoma	Eukaryota
Diplophos	Eukaryota
Dirofilaria	Eukaryota
Dogania	Eukaryota
Dromaius	Eukaryota
Dromiciops	Eukaryota
Drosophila	Eukaryota
Dugong	Eukaryota
Echinococcus	Eukaryota
Echinops	Eukaryota
Echinosorex	Eukaryota
Edwardsiella	Bacteria
Ehrlichia	Bacteria
Eigenmannia	Eukaryota
Eimeria	Eukaryota
Elassoma	Eukaryota
Eleotris	Eukaryota
Elephantulus	Eukaryota
Elephas	Eukaryota
Elops	Eukaryota
Elusimicrobium	Bacteria
Emeus	Eukaryota
Emiliania	Eukaryota
Emmelichthys	Eukaryota
Encephalitozoon	Eukaryota
Enedrias	Eukaryota
Engraulis	Eukaryota
Enterobacter	Bacteria
Enterococcus	Bacteria
Epifagus	Eukaryota
Episoriculus	Eukaryota
Eptatretus	Eukaryota
Equus	Eukaryota
Eremothecium	Eukaryota
Erinaceus	Eukaryota
Erpetoichthys	Eukaryota
Erwinia	Bacteria
Erysipelothrix	Bacteria
Erythrobacter	Bacteria
Escherichia	Bacteria
Eschrichtius	Eukaryota
Esox	Eukaryota
Etheostoma	Eukaryota
Eudromia	Eukaryota
Eudyptula	Eukaryota
Euglena	Eukaryota
Eumeces	Eukaryota
Eumetopias	Eukaryota
Eurypharynx	Eukaryota
Eutaeniophorus	Eukaryota
Euthynnus	Eukaryota
Exiguobacterium	Bacteria
Exocoetus	Eukaryota
Falco	Eukaryota
Fasciola	Eukaryota
Fejervarya	Eukaryota
Felis	Eukaryota
Ferroplasma	Archaea
Fervidobacterium	Bacteria
Flavobacteria	Bacteria
Flavobacteriales	Bacteria
Flavobacterium	Bacteria
Florometra	Eukaryota
Francisella	Bacteria
Frankia	Bacteria
Fugu	Eukaryota
Fusarium	Eukaryota
Fusobacterium	Bacteria
Gadus	Eukaryota
Galaxias	Eukaryota
Gallus	Eukaryota
Gambusia	Eukaryota
Gasterosteus	Eukaryota
Geobacillus	Bacteria
Geobacter	Bacteria
Gibberella	Eukaryota
Gloeobacter	Bacteria
Glossanodon	Eukaryota
Gluconobacter	Bacteria
Gomphiocephalus	Eukaryota
Gonorynchus	Eukaryota
Gonostoma	Eukaryota
Gordonia	Bacteria
Gorilla	Eukaryota
Gracilaria	Eukaryota
Gracilariopsis	Eukaryota
Gramella	Bacteria
Granulibacter	Bacteria
Guillardia	Eukaryota
Gymnothorax	Eukaryota
Haemaphysalis	Eukaryota
Haematopus	Eukaryota
Haemophilus	Bacteria
Hahella	Bacteria
Halichoerus	Eukaryota
Haloarcula	Archaea
Halobacterium	Archaea
Halocynthia	Eukaryota
Haloquadratum	Archaea
Halorhodospira	Bacteria
Halorubrum	Archaea
Harpadon	Eukaryota
Harpochytrium	Eukaryota
Helicobacter	Bacteria
Helicolenus	Eukaryota
Hemiechinus	Eukaryota
Herminiimonas	Bacteria
Herpetosiphon	Bacteria
Heterodontus	Eukaryota
Heterodoxus	Eukaryota
Hiodon	Eukaryota
Hippopotamus	Eukaryota
Histophilus	Bacteria
Homo	Eukaryota
Honeysuckle	Virus
Hoplostethus	Eukaryota
Huso	Eukaryota
Hyaloraphidium	Eukaryota
Hylobates	Eukaryota
Hymenolepis	Eukaryota
Hyperoodon	Eukaryota
Hyperthermus	Archaea
Hyphomonas	Bacteria
Hypoatherina	Eukaryota
Hypocrea	Eukaryota
Hypoptychus	Eukaryota
IBEA	Environmental Sample
Ictalurus	Eukaryota
Idiomarina	Bacteria
Ignicoccus	Archaea
Iguana	Eukaryota
Ijimaia	Eukaryota
IncN	Plasmid
IncQ-like	Plasmid
Indostomus	Eukaryota
Inia	Eukaryota
Isoodon	Eukaryota
Ixodes	Eukaryota
JGIenv	Environmental Sample
Jaculus	Eukaryota
Janibacter	Bacteria
Katharina	Eukaryota
Katsuwonus	Eukaryota
Kineococcus	Bacteria
Klebsiella	Bacteria
Kogia	Eukaryota
Korarchaeum	Archaea
Lactobacillus	Bacteria
Lactococcus	Bacteria
Lagenorhynchus	Eukaryota
Lama	Eukaryota
Laminaria	Eukaryota
Lampetra	Eukaryota
Lampris	Eukaryota
Lampsilis	Eukaryota
Laqueus	Eukaryota
Latimeria	Eukaryota
Lefua	Eukaryota
Legionella	Bacteria
Leifsonia	Bacteria
Leishmania	Eukaryota
Lemur	Eukaryota
Lepidosiren	Eukaryota
Lepisosteus	Eukaryota
Leptolyngbya	Bacteria
Leptospira	Bacteria
Lepus	Eukaryota
Leuconostoc	Bacteria
Limulus	Eukaryota
Listeria	Bacteria
Listonella	Bacteria
Lithobius	Eukaryota
Locusta	Eukaryota
Loktanella	Bacteria
Loligo	Eukaryota
Lophius	Eukaryota
Lota	Eukaryota
Lotus	Eukaryota
Loxodonta	Eukaryota
Lumbricus	Eukaryota
Lycodes	Eukaryota
Macaca	Eukaryota
Macropus	Eukaryota
Macroscelides	Eukaryota
Magnaporthe	Eukaryota
Magnetococcus	Bacteria
Magnetospirillum	Bacteria
Malawimonas	Eukaryota
Manis	Eukaryota
Mannheimia	Bacteria
Marchantia	Eukaryota
Maricaulis	Bacteria
Marinobacter	Bacteria
Marinococcus	Bacteria
Marinomonas	Bacteria
Mastacembelus	Eukaryota
Masturus	Eukaryota
Medicago	Eukaryota
Megalops	Eukaryota
Melanocetus	Eukaryota
Melanonus	Eukaryota
Melanotaenia	Eukaryota
Melipona	Eukaryota
Mertensiella	Eukaryota
Mesoplasma	Bacteria
Mesorhizobium	Bacteria
Mesostigma	Eukaryota
Metallosphaera	Archaea
Methanobrevibacter	Archaea
Methanocaldococcus	Archaea
Methanococcoides	Archaea
Methanococcus	Archaea
Methanocorpusculum	Archaea
Methanoculleus	Archaea
Methanohalophilus	Archaea
Methanopyrus	Archaea
Methanoregula	Archaea
Methanosaeta	Archaea
Methanosarcina	Archaea
Methanosphaera	Archaea
Methanospirillum	Archaea
Methanothermobacter	Archaea
Methylibium	Bacteria
Methylobacillus	Bacteria
Methylobacterium	Bacteria
Methylococcus	Bacteria
Methylophaga	Bacteria
Metridium	Eukaryota
Microbulbifer	Bacteria
Micrococcus	Bacteria
Microcystis	Bacteria
Microscilla	Bacteria
Mogera	Eukaryota
Mola	Eukaryota
Monoblepharella	Eukaryota
Monocentris	Eukaryota
Monodon	Eukaryota
Monopterus	Eukaryota
Monosiga	Eukaryota
Moorella	Bacteria
Moraxella	Bacteria
Mugil	Eukaryota
Muntiacus	Eukaryota
Mus	Eukaryota
Mustelus	Eukaryota
Mycobacterium	Bacteria
Mycoplasma	Bacteria
Myctophum	Eukaryota
Myoxus	Eukaryota
Myripristis	Eukaryota
Myxine	Eukaryota
Naegleria	Eukaryota
Nannospalax	Eukaryota
Nanoarchaeum	Archaea
Nansenia	Eukaryota
Narceus	Eukaryota
Natronobacterium	Archaea
Natronomonas	Archaea
Necator	Eukaryota
Neisseria	Bacteria
Neoceratodus	Eukaryota
Neocyttus	Eukaryota
Neorickettsia	Bacteria
Neoscopelus	Eukaryota
Nephroselmis	Eukaryota
Neurospora	Eukaryota
Nicotiana	Eukaryota
Nitrobacter	Bacteria
Nitrococcus	Bacteria
Nitrosococcus	Bacteria
Nitrosomonas	Bacteria
Nitrosopumilus	Archaea
Nitrosospira	Bacteria
Nocardia	Bacteria
Nostoc	Bacteria
Notacanthus	Eukaryota
Novosphingobium	Bacteria
Nycticebus	Eukaryota
Oceanicaulis	Bacteria
Oceanicola	Bacteria
Oceanobacillus	Bacteria
Ochotona	Eukaryota
Ochromonas	Eukaryota
Odobenus	Eukaryota
Odontella	Eukaryota
Oenococcus	Bacteria
Oenothera	Eukaryota
Okra	Virus
Onchocerca	Eukaryota
Oncorhynchus	Eukaryota
Onion	Bacteria
Ophiopholis	Eukaryota
Ophisurus	Eukaryota
Opisthoproctus	Eukaryota
Ornithodoros	Eukaryota
Ornithorhynchus	Eukaryota
Orycteropus	Eukaryota
Oryctolagus	Eukaryota
Oryza	Eukaryota
Oryzias	Eukaryota
Osteoglossum	Eukaryota
Ostichthys	Eukaryota
Ostrinia	Eukaryota
Ovis	Eukaryota
Paenibacillus	Bacteria
Pagrus	Eukaryota
Pagurus	Eukaryota
Pan	Eukaryota
Pantodon	Eukaryota
Pantoea	Bacteria
Panulirus	Eukaryota
Papio	Eukaryota
Parabacteroides	Bacteria
Paracentrotus	Eukaryota
Parachlamydia	Bacteria
Paracoccus	Bacteria
Paragonimus	Eukaryota
Paralichthys	Eukaryota
Paramecium	Eukaryota
Parazen	Eukaryota
Parvibaculum	Bacteria
Parvularcula	Bacteria
Pasteurella	Bacteria
Pasteuria	Bacteria
Peanut	Bacteria
Pedinomonas	Eukaryota
Pediococcus	Bacteria
Pelagibacter	Bacteria
Pelobacter	Bacteria
Pelodictyon	Bacteria
Pelomedusa	Eukaryota
Penaeus	Eukaryota
Penicillium	Eukaryota
Percopsis	Eukaryota
Petromyzon	Eukaryota
Petroscirtes	Eukaryota
Petrotoga	Bacteria
Phage	Virus
Phenacogrammus	Eukaryota
Phoca	Eukaryota
Phocoena	Eukaryota
Phormidium	Bacteria
Photobacterium	Bacteria
Photorhabdus	Bacteria
Physarum	Eukaryota
Physcomitrella	Eukaryota
Physeter	Eukaryota
Physiculus	Eukaryota
Phytophthora	Eukaryota
Phytoplasma	Bacteria
Pichia	Eukaryota
Picrophilus	Archaea
Pinus	Eukaryota
Pipistrellus	Eukaryota
Pirellula	Bacteria
Pisaster	Eukaryota
Plasmid	Plasmid
Plasmodium	Eukaryota
Platanista	Eukaryota
Platichthys	Eukaryota
Platynereis	Eukaryota
Platytroctes	Eukaryota
Plecoglossus	Eukaryota
Pleurotus	Eukaryota
Podospora	Eukaryota
Polaribacter	Bacteria
Polaromonas	Bacteria
Polymixia	Eukaryota
Polynucleobacter	Bacteria
Polyodon	Eukaryota
Polypterus	Eukaryota
Pongo	Eukaryota
Pontoporia	Eukaryota
Poromitra	Eukaryota
Porphyra	Eukaryota
Porphyromonas	Bacteria
Portunus	Eukaryota
Prevotella	Bacteria
Procavia	Eukaryota
Prochlorococcus	Bacteria
Propionibacterium	Bacteria
Prosthecochloris	Bacteria
Proteus	Bacteria
Protopterus	Eukaryota
Prototheca	Eukaryota
Psephurus	Eukaryota
Pseudoalteromonas	Bacteria
Pseudobagrus	Eukaryota
Pseudomonas	Bacteria
Psilotum	Eukaryota
Psychrobacter	Bacteria
Psychromonas	Bacteria
Pterocaesio	Eukaryota
Pterocnemia	Eukaryota
Pteropus	Eukaryota
Pterothrissus	Eukaryota
Pupa	Eukaryota
Pylaiella	Eukaryota
Pyrobaculum	Archaea
Pyrococcus	Archaea
Pyrocoelia	Eukaryota
Raja	Eukaryota
Ralstonia	Bacteria
Rana	Eukaryota
Ranodon	Eukaryota
Rattus	Eukaryota
Reclinomonas	Eukaryota
Reinekea	Bacteria
Retropinna	Eukaryota
Rhea	Eukaryota
Rhinoceros	Eukaryota
Rhinolophus	Eukaryota
Rhipicephalus	Eukaryota
Rhizobium	Bacteria
Rhizophydium	Eukaryota
Rhodobacter	Bacteria
Rhodobacterales	Bacteria
Rhodococcus	Bacteria
Rhodoferax	Bacteria
Rhodomonas	Eukaryota
Rhodopseudomonas	Bacteria
Rhodospirillum	Bacteria
Rhodothermus	Bacteria
Rhyacichthys	Eukaryota
Rhyncholestes	Eukaryota
Rhynchosia	Virus
Rickettsia	Bacteria
Riemerella	Bacteria
Rivulus	Eukaryota
Robiginitalea	Bacteria
Roboastra	Eukaryota
Rondeletia	Eukaryota
Roseiflexus	Bacteria
Roseobacter	Bacteria
Roseovarius	Bacteria
Rubrivivax	Bacteria
Rubrobacter	Bacteria
Ruegeria	Bacteria
Ruminococcus	Bacteria
Ruthia	Bacteria
Saccharomyces	Eukaryota
Saccharophagus	Bacteria
Saccopharynx	Eukaryota
Salangichthys	Eukaryota
Salarias	Eukaryota
Salinibacter	Bacteria
Salinispora	Bacteria
Salmo	Eukaryota
Salmonella	Bacteria
Salvelinus	Eukaryota
Sarcocheilichthys	Eukaryota
Sardinops	Eukaryota
Sargocentron	Eukaryota
Satyrichthys	Eukaryota
Saurida	Eukaryota
Scaphirhynchus	Eukaryota
Scenedesmus	Eukaryota
Schistosoma	Eukaryota
Schizophyllum	Eukaryota
Schizosaccharomyces	Eukaryota
Sciurus	Eukaryota
Scopelogadus	Eukaryota
Scyliorhinus	Eukaryota
Sebastes	Eukaryota
Selenomonas	Bacteria
Serratia	Bacteria
Shewanella	Bacteria
Shigella	Bacteria
Silicibacter	Bacteria
Sinorhizobium	Bacteria
Siphonodentalium	Eukaryota
Smithornis	Eukaryota
Sodalis	Bacteria
Solibacter	Bacteria
Sorangium	Bacteria
Sorex	Eukaryota
Sphenodon	Eukaryota
Sphingomonas	Bacteria
Sphingopyxis	Bacteria
Spinacia	Eukaryota
Spiroplasma	Bacteria
Spizellomyces	Eukaryota
Squalus	Eukaryota
Staphylococcus	Bacteria
Staphylothermus	Archaea
Stenotrophomonas	Bacteria
Stephanolepis	Eukaryota
Streptococcus	Bacteria
Streptomyces	Bacteria
Strongylocentrotus	Eukaryota
Strongyloides	Eukaryota
Struthio	Eukaryota
Sufflamen	Eukaryota
Sulfitobacter	Bacteria
Sulfolobus	Archaea
Sulfurovum	Bacteria
Sus	Eukaryota
Symbiobacterium	Bacteria
Synaphobranchus	Eukaryota
Synechococcus	Bacteria
Synechocystis	Bacteria
Syntrophobacter	Bacteria
Syntrophomonas	Bacteria
Syntrophus	Bacteria
Tachyglossus	Eukaryota
Taenia	Eukaryota
Talpa	Eukaryota
Tamandua	Eukaryota
Tapirus	Eukaryota
Tarsius	Eukaryota
Tenacibaculum	Bacteria
Terebratalia	Eukaryota
Terebratulina	Eukaryota
Tetrahymena	Eukaryota
Tetraodon	Eukaryota
Tetrodontophora	Eukaryota
Thanatephorus	Eukaryota
Theragra	Eukaryota
Thermoanaerobacter	Bacteria
Thermoanaerobacterium	Bacteria
Thermobifida	Bacteria
Thermococcus	Archaea
Thermofilum	Archaea
Thermoplasma	Archaea
Thermosipho	Bacteria
Thermosynechococcus	Bacteria
Thermotoga	Bacteria
Thermus	Bacteria
Thiobacillus	Bacteria
Thiomicrospira	Bacteria
Thrips	Eukaryota
Thryonomys	Eukaryota
Thunnus	Eukaryota
Thylamys	Eukaryota
Thyropygus	Eukaryota
Tigriopus	Eukaryota
Tinamus	Eukaryota
Tobacco	Virus
Tomato	Virus
Torrubiella	Eukaryota
Toxoplasma	Eukaryota
Trachipterus	Eukaryota
Trachurus	Eukaryota
Treponema	Bacteria
Triatoma	Eukaryota
Tribolium	Eukaryota
Trichinella	Eukaryota
Trichodesmium	Bacteria
Tricholepidion	Eukaryota
Trichosurus	Eukaryota
Triops	Eukaryota
Triticum	Eukaryota
Tropheryma	Bacteria
Trypanosoma	Eukaryota
Tupaia	Eukaryota
Typhlonectes	Eukaryota
Ureaplasma	Bacteria
Urotrichus	Eukaryota
Ursus	Eukaryota
Vargula	Eukaryota
Varroa	Eukaryota
Venerupis	Eukaryota
Verminephrobacter	Bacteria
Vesicomyosocius	Bacteria
Vibrio	Bacteria
Vidua	Eukaryota
Virus	Virus
Volemys	Eukaryota
Vombatus	Eukaryota
Wigglesworthia	Bacteria
Wolbachia	Bacteria
Wolinella	Bacteria
Woolly	Virus
Xanthomonas	Bacteria
Xenopus	Eukaryota
Xylella	Bacteria
Yarrowia	Eukaryota
Yersinia	Bacteria
Zea	Eukaryota
Zenion	Eukaryota
Zenopsis	Eukaryota
Zeus	Eukaryota
Zinnia	Virus
Zu	Eukaryota
Zygosaccharomyces	Eukaryota
Zymomonas	Bacteria
gamma	Bacteria
haloarchaeal	Archaea
lepidopsocid	Eukaryota
marine	Bacteria
pHG1:	Bacteria
uncultured	Bacteria
