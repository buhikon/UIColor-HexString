UIColor-HexString
=================

UIColor-HexString creates UIColor instance with HEX string.


## How To Use

```
#import "UIColor+HexString.h"
```


```
UIColor *color = [UIColor colorWithHexString:@"AABBCCFF"];
```


## Issues

HEX String paramater can be 3, 4, 6, 8 letters. Also "0x" and "#" prefix are acceptable.


e.g. 
```
@"#abcf"		// R:a,  G:b,  B:c,  A:f
@"ABC"			// R:a,  G:b,  B:c,  A:f
@"aAbBcC"		// R:aa, G:bb, B:cc, A:ff
@"AABBCC30"		// R:aa, G:bb, B:xx, A:30
@"0xaabbcc"		// R:aa, G:bb, B:cc, A:ff
```



## License

This is released under an MIT license.
