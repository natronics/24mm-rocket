#!/usr/bin/env python
from openrocketdoc import loaders
from openrocketdoc import writers


ork = loaders.Openrocket()
rocket = ork.load('24mm_minimum_dia.ork')
svg = writers.SVG.dump(rocket)

print(svg)
