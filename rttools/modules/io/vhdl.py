from decorator import contextmanager
import networkx as nx
import sys
import os.path
from os import path

from lib.terminal import info


LOCATION = "./pkt-sim/packets/"

# extract the time which each packet must be injected into the network
# from the given output file generated by minizinc
def generateVhdlSimInput(arch, packets):

  # organize packets by source
  sources = {}

  for p in packets:

    source = p['source']['node']

    l = []
    if source in sources:
      l = sources[source]

    # add packet to that source
    l.append({
      'name' : p['name'],
      'source' : p['source'],
      'target' : p['target'],
      'numflits' : p['num_flit'],
      'release' : p['release'],
      'deadline' : p['abs_deadline']
    })
    sources[source] = l


  info("Generating pkt-sim input at `./pkt-sim/packets`")

  # create one file per source
  for s in sources:
    source = sources[s]

    # sort sources by release
    
    entry_format = "{release} {size} {target} {deadline}\n"
    with open('./pkt-sim/packets/' + str(s) + ".txt", "w+") as file:
      for k in source:
        file.write(entry_format.format(
          release = str(k['release']),
          size = k['numflits'],
          target = k['target']['node'],
          deadline = k['deadline']
        ))

  
  for e in arch.nodes(data=True):
    node, data = e
    
    if not (node in sources):
      with open('./pkt-sim/packets' + str(node) + ".txt", "w+") as file:
        file.write('')

  return s