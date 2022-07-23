from modules.backend.ags import search3
from modules.backend.ags import heuristics

from lib.terminal import warn, error, info

#from heuristics import lstf, mbuf, mcpf
#from prelaunchtest import prelaunchtest
#from svg import saveSvg

#from problem_syntheticA import problem
#from problem_dctVerify import problem
#from problem_carshi2 import problem

# lstf(solution_space),  packet with the least slack time first
# mcpf(occupancy),       packet in most conflicting links first
# mbuf(occupancy),       packets with most network overhead first
HEURISTIC = heuristics.mbuf
STEP = 100
TRIES = 500


def agsExport(packets, links, hp, mapping, arch, appname, prunning, fail):

  min_start = [[None for y in range(0,len(packets))] for x in range(0, len(links))]
  occupancy = [[None for y in range(0,len(packets))] for x in range(0, len(links))]
  deadline = [[None for y in range(0,len(packets))] for x in range(0, len(links))]

  for l in range(0, len(links)):
    source, target, data = links[l]
    label = data['label']

    for p in range(0, len(packets)):
      paths = packets[p]['path']

      for e in range(0, len(paths)):
        label2 = paths[e]['data']['label']

        # packet has that link
        if(label == label2):
          min_start[l][p] = packets[p]['min_start']
          deadline[l][p] = packets[p]['abs_deadline']
          occupancy[l][p] = packets[p]['net_time']

  # remove unused links from tables
  removal = []
  for i in range(0, len(occupancy)):
    isNone = True
    for j in occupancy[i]:
      if j != None:
        isNone = False
        break
    if isNone:
      removal.append(i)
  
  for i in range(0, len(min_start)):
    error(str(min_start[i]) + '\t' + str(links[i][2]['label']) )
    
  # remove unused links from links list 
  remIdx = 0
  for i in removal:
    del min_start[i - remIdx]
    del occupancy[i - remIdx]
    del deadline[i- remIdx]
    remIdx = remIdx + 1

  problem = {
    'min_start' : min_start,
    'occupancy' : occupancy,
    'deadline' : deadline,
    'packets' : packets,
    'links': links,
    'hyperperiod' : hp
  }

  return runAgs(problem, step=prunning, tries=fail)


def runAgs(problem, heuristic = HEURISTIC, step = STEP, tries = TRIES):
  
  res, skipped = search3.search3(problem, heuristic, tries, step)
  
  #saveSvg(res, problem, skipped)

  if len(skipped) == 0:
    return res
  else: 
    return None
  