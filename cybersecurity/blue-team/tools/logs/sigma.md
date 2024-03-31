# Sigma

[![adventofcyber4](../../../_badges/thm/adventofcyber4/day16.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

[sigma](https://github.com/SigmaHQ/sigma) <small>(7.5k ⭐)</small> is a generic solutions to write log filtering rules for any SIEM. We write a YAML rule and use [pySigma](https://github.com/SigmaHQ/pySigma) <small>(0.4k ⭐)</small> or [uncoder](https://uncoder.io/) to compile it for any SIEM solution.

```yaml!
title: XXX
id: UUID 
status: experimental
description: XXX
```

```yaml
logsource:
  product: windows # or Linux, etc.
  service: security # or procmon, etc.
```

</div><div>

```yaml
detection:
  selection:
    EventID: ['event_id_here']
    Image|endswith: ['\xxx.exe']
    CommandLine|contains|all:
      - cmd.exe
      - '-c '   
  condition: selection
```

```yaml
falsepositives:
  - unknown
level: low
tags:
   - attack.persistence # Points to the MITRE Tactic
   - attack.T1136.001 # Points to the MITRE Technique
```
</div></div>