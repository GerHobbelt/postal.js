
# after `npm install` ANVIL will be located here:
ANVIL=node_modules/.bin/anvil
# for `npm install -g` - which is advised against:
#ANVIL=anvil


.PHONY: all clean

all: lib/postal.js lib/postal.min.js examples


lib/postal.js lib/postal.min.js:                            \
		build.json                                          \
		header.js                                           \
		src/AmqpBindingsResolver.js                         \
		src/Api.js                                          \
		src/ChannelDefinition.js                            \
		src/ConsecutiveDistinctPredicate.js                 \
		src/DistinctPredicate.js                            \
		src/LocalBus.js                                     \
		src/postal.js                                       \
		src/SubscriptionDefinition.js 						\
		$(ANVIL)	
	$(ANVIL)

examples: 													\
		example/standard/js/postal.js 						\
		example/amd/js/libs/postal/postal.js	

example/standard/js/postal.js 								\
example/amd/js/libs/postal/postal.js						\
		: lib/postal.js			
	cp $< $@

$(ANVIL):
	npm install
	
clean:
	-@rm -f lib/postal.js lib/postal.min.js
