UIColor-HexString
=================

UIColor+HexString
Create UIColor instance with HEX string


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
#abcf
ABC
aAbBcC
AABBCC30
0xaabbcc
```



## License

This is released under an MIT license.
