"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestAnimalsHouseComponents,
	#superclass : #PackageManifest,
	#category : #'AnimalsHouse-Components-Manifest'
}

{ #category : #'code-critics' }
ManifestAnimalsHouseComponents class >> ruleParseTreeLintRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#AHScreenComponent #children #false)) #'2022-05-24T04:35:11.838+03:00') #(#(#RGMethodDefinition #(#AHApplicationRootComponent #children #false)) #'2022-05-24T04:35:48.242+03:00') )
]
