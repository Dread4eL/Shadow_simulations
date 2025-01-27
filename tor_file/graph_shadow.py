import tornettools as tt
import matplotlib.pyplot as plt

logfile = 'shadow.log'

data=tt.load(logfile)

latency_data = data['latency']

times = latency_data['times']
latencies = latency_data['latencies']

plt.plot(times,latencies)
plt.xlabel('Time')
plt.ylabel('Latency (ms)')
plt.title('Latency Over Time')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
