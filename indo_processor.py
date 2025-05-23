
from Sastrawi.Stemmer.StemmerFactory import StemmerFactory
from Sastrawi.StopWordRemover.StopWordRemoverFactory import StopWordRemoverFactory
import pandas
import re

def clear_punc(text):
    text = text.lower()
    text = re.sub(r'[^\w\s]', ' ', text)
    return text

slang      = pandas.read_csv(r"dataset\slang-indo.csv").to_numpy()
slang_dict = {pair[0]: pair[1] for pair in slang}
slang      = pandas.read_csv(r"dataset\colloquial-indonesian-lexicon.csv").to_numpy() # append new data into the dict
for line in slang: slang_dict[line[0]] = line[1]

stemmer      =         StemmerFactory().create_stemmer().stem
stopword_rmv = StopWordRemoverFactory().create_stop_word_remover().remove

def process(line: str):
    line = clear_punc(line).split(" ")

    processed_1 = stemmer(" ".join([slang_dict.get(word, word) for word in line]))
    processed_2 = stemmer(" ".join([slang_dict.get(word, word) for word in processed_1.split(" ")]))
    processed_3 = stopword_rmv(processed_2)

    return processed_3