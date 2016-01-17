from scipy import io as scio
import numpy as np
import numpy
from os import system
from argparse import ArgumentParser
from string import replace
import igraph as ig
import numpy as np
from collections import defaultdict
import gc
import psutil
import os

def convert_graph(linein, lineout):
        datastruct = np.load(linein)
        #the attribute where the timeseries is stored
        data=datastruct['roi_data']
        numrois=data.shape[0]
        cormtx=np.corrcoef(data)
        cormtx=abs(cormtx)
        #subtract out the diagonal
        cormtx=(cormtx-numpy.eye(numrois))

        #initialize empty dictionary of floats
        edge_dict=defaultdict(float)
        #add element wise to a dictionary of the edges
        for i in range(0, numrois) :
                #print("Processing roi {0}...".format(i))
                for j in range(0, numrois) :
                        edge_dict[(i, j)] = cormtx[i,j];

        #print("Adding edges to the graph...")
        new_graph = ig.Graph(n=numrois, directed=False)
        new_graph+=edge_dict.keys()
        #print("Adding edge weights to the graph...")
        new_graph.es["weight"] = edge_dict.values()
        z=ig.write(new_graph, lineout, format="graphml")




def main():
        parser = ArgumentParser(description="")
        parser.add_argument("in_file", help = "the npz files to convert to .mat format.")
        parser.add_argument("out_file", help = "the graphml files to go to graphml format")
        result = parser.parse_args()
        convert_graph(result.in_file, result.out_file)

if __name__ == "__main__":
        main()

