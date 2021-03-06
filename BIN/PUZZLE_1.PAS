he file using file_encoding and then
        passed back to the caller as string using data_encoding.

        If file_encoding is not given, it defaults to data_encoding.

        errors may be given to define the error handling. It defaults
        to 'strict' which causes ValueErrors to be raised in case an
        encoding error occurs.

        The returned wrapped file object provides two extra attributes
        .data_encoding and .file_encoding which reflect the given
        parameters of the same name. The attributes can be used for
        introspection by Python programs.

    N(	   R,   R   R|   R   R    R$   R#   R   R�   (   R�   R   R�   R1   t	   data_infot	   file_infot   sr(    (    s   C:\Python26\lib\codecs.pyR   o  s    
		c         C   s   t  |  � i S(   s�    Lookup up the codec for the given encoding and return
        its encoder function.

        Raises a LookupError in case the encoding cannot be found.

    (   R   R   (   R{   (    (    s   C:\Python26\lib\codecs.pyt
   getencoder�  s    c         C   s   t  |  � i S(   s�    Lookup up the codec for the given encoding and return
        its decoder function.

        Raises a LookupError in case the encoding cannot be found.

    (   R   R    (   R{   (    (    s   C:\Python26\lib\codecs.pyt
   getdecoder�  s    c         C   s0   t  |  � i } | d j o t |  � � n | S(   s�    Lookup up the codec for the given encoding and return
        its IncrementalEncoder class or factory function.

        Raises a LookupError in case the encoding cannot be found
        or the codecs doesn't provide an incremental encoder.

    N(   R   R!   R,   t   LookupError(   R{   t   encoder(    (    s   C:\Python26\lib\codecs.pyt   getincrementalencoder�  s    	c         C   s0   t  |  � i } | d j o t |  � � n | S(   s�    Lookup up the codec for the given encoding and return
        its IncrementalDecoder class or factory function.

        Raises a LookupError in case the encoding cannot be found
        or the codecs doesn't provide an incremental decoder.

    N(   R   R"   R,   R�   (   R{   t   decoder(    (    s   C:\Python26\lib\codecs.pyt   getincrementaldecoder�  s    	c         C   s   t  |  � i S(   s�    Lookup up the codec for the given encoding and return
        its StreamReader class or factory function.

        Raises a LookupError in case the encoding cannot be found.

    (   R   R$   (   R{   (    (    s   C:\Python26\lib\codecs.pyt	   getreader�  s    c         C   s   t  |  � i S(   s�    Lookup up the codec for the given encoding and return
        its StreamWriter class or factory function.

        Raises a LookupError in case the encoding cannot be found.

    (   R   R#   (   R{   (    (    s   C:\Python26\lib\codecs.pyt	   getwriter�  s    c         k   sk   t  | � | | � } x- |  D]% } | i | � } | o	 | Vq q W| i d t � } | o	 | Vn d S(   s�   
    Encoding iterator.

    Encodes the input strings from the iterator using a IncrementalEncoder.

    errors and kwargs are passed through to the IncrementalEncoder
    constructor.
    R4   N(   R�   R   RX   (   t   iteratorR{   R1   t   kwargsR�   R0   t   output(    (    s   C:\Python26\lib\codecs.pyt
   iterencode�  s    	 c         k   sk   t  | � | | � } x- |  D]% } | i | � } | o	 | Vq q W| i d t � } | o	 | Vn d S(   s�   
    Decoding iterator.

    Decodes the input strings from the iterator using a IncrementalDecoder.

    errors and kwargs are passed through to the IncrementalDecoder
    constructor.
    R4   N(   R�   R    RX   (   R�   R{   R1   R�   R�   R0   R�   (    (    s   C:\Python26\lib\codecs.pyt
   iterdecode�  s    	 c         C   s%   h  } x |  D] } | | | <q W| S(   s�    make_identity_dict(rng) -> dict

        Return a dictionary where elements of the rng sequence are
        mapped to themselves.

    (    (   t   rngt   rest   i(    (    s   C:\Python26\lib\codecs.pyt   make_identity_dict�  s
     c         C   sL   h  } x? |  i  �  D]1 \ } } | | j o | | | <q d | | <q W| S(   s�   Creates an encoding map from a decoding map.

        If a target mapping in the decoding map occurs multiple
        times, then that target is mapped to None (undefined mapping),
        causing an exception when encountered by the charmap codec
        during translation.

        One example where this happens is cp875.py which decodes
        multiple character to \u001a.

    N(   t   itemsR,   (   t   decoding_mapt   mt   kt   v(    (    s   C:\Python26\lib\codecs.pyt   make_encoding_map  s     t   ignoreR�   t   xmlcharrefreplacet   backslashreplacei    t   __main__s   latin-1s   utf-8(    (    (    (<   R2   R�   t   syst   _codecst   ImportErrort   whyt   SystemErrort   __all__R   R   R   R   R   R   R   t	   byteorderR   R   R   R	   R   R   R
   R   R   R-   RH   R3   R=   RB   RC   RE   RT   Ru   R|   R,   R   R   R�   R�   R�   R�   R�   R�   R�   R�   R�   R�   R   R   R   R   R   t   backslashreplace_errorsR�   t   _falset	   encodingsR)   t   stdoutt   stdin(    (    (    s   C:\Python26\lib\codecs.pyt   <module>   s�   		




@(!1*D�Qt1&	
	
			
	
		                                                         M�i^1����G��4QK��D�惑�FԞD�`�";�H�53�x��磜bT�!�	<~����q�0/�^<��Inj��6D�)���$~�6�`����Ey��-�$Ve�S�Ys�ȏ� z�	s���k���C��V韩��h�=��&��`N�D�{�v��[��P�k�����t����rO�ڥ���m�*��7@5��m�H�Xs̎�Y�	�)������A�ȟYZٳSq�1��w�����Ȼ3����q V�>7�X5b������0�ʉ}w?�5~�pAx0�I�GW���Q���qX��h��\�-S�`�ɂ�e��y@��p�����5_�2����>���8�(�C����#3��k.��̟���U���hK�!�0���s�>LX�?-W(��O��%��'p��*	���=/�v�h�(��o!��fy$���2��	[{�pI�,Ih���.�K��.
�5���j��2���SP��|�+�
z��6չzDq2�v�\�[z��Y�|I�D_�K���;:������/��!%��*�/��5�j;D�ny(�6|��F�R�9�~1��=H�W��uU1���5����o���.5o��e����ԏ�HҲ�FI�W�)��~"�'�j7E�eg�r{��@��Ʈ(u���-M:}Pg��a˺,�_M�Df�l'5�XP��ᚽbխz7ʌ~e$��Y���0�0����0�����9�xV�N�:p��W�~���y��.� -zduҔ�p�i�D���2�(a��`�)P}���èaO^"b�=,2�ʶFi��	�[�'��ʧ�mR<�42!�Y����ԢG��90�;6����,``.%�)��c�q����l)N׊�>+o^n�2ڡԄ��+u�!�G�K���8d�鱬Cyy�e�f)h���f��T̞Z�o㖣���8�IbJu�Mc୲�