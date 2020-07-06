/* An actor that synchronizes tokens.

 Copyright (c) 1997-2014 The Regents of the University of California.
 All rights reserved.
 Permission is hereby granted, without written agreement and without
 license or royalty fees, to use, copy, modify, and distribute this
 software and its documentation for any purpose, provided that the above
 copyright notice and the following two paragraphs appear in all copies
 of this software.

 IN NO EVENT SHALL THE UNIVERSITY OF CALIFORNIA BE LIABLE TO ANY PARTY
 FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
 ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF
 THE UNIVERSITY OF CALIFORNIA HAS BEEN ADVISED OF THE POSSIBILITY OF
 SUCH DAMAGE.

 THE UNIVERSITY OF CALIFORNIA SPECIFICALLY DISCLAIMS ANY WARRANTIES,
 INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE
 PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND THE UNIVERSITY OF
 CALIFORNIA HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES,
 ENHANCEMENTS, OR MODIFICATIONS.

 PT_COPYRIGHT_VERSION_2
 COPYRIGHTENDKEY

 */
package ptolemy.actor.lib;

import ptolemy.actor.TypedIOPort;
import ptolemy.data.Token;
import ptolemy.kernel.CompositeEntity;
import ptolemy.kernel.util.IllegalActionException;
import ptolemy.kernel.util.NameDuplicationException;

///////////////////////////////////////////////////////////////////
//// Synchronizer

/**
 This actor implements a token synchronizer.  It has one input port and
 one output port, both of which are multiports.  When at least one token
 exists on every input channel, exactly one token is consumed from each
 input channel, and the tokens are output on the corresponding output
 channels. If any input channel is missing a token, then no output is
 produced.
 <p>
 Note that the ordering of channels of a multiport is determined by the
 order of connection.  Thus the n<sup>th</sup> input channel connected
 corresponds to the n<sup>th</sup> output channel connected.

 @author Paul Whitaker
 @version $Id$
 @since Ptolemy II 1.0
 @Pt.ProposedRating Yellow (pwhitake)
 @Pt.AcceptedRating Yellow (pwhitake)
 */
public class Synchronizer2 extends Transformer {
    /** Construct an actor in the specified container with the specified
     *  name.
     *  @param container The container.
     *  @param name The name of this actor within the container.
     *  @exception IllegalActionException If the actor cannot be contained
     *   by the proposed container.
     *  @exception NameDuplicationException If the name coincides with
     *   an actor already in the container.
     */
    public Synchronizer2(CompositeEntity container, String name)
            throws IllegalActionException, NameDuplicationException {
        super(container, name);
        input.setMultiport(false);
        output.setMultiport(false);
        
        input2 = new TypedIOPort(this, "input2", true, false);
        output2 = new TypedIOPort(this, "output2", false, true);

        _attachText("_iconDescription",
                "<svg>\n" + "<polygon points=\"-10,20 10,10 10,-10, -10,-20\" "
                        + "style=\"fill:yellow\"/>\n" + "</svg>\n");
    }
    
    ///////////////////////////////////////////////////////////////////
    ////                         public variables                  ////
    
    public TypedIOPort input2;
    
    public TypedIOPort output2;

    ///////////////////////////////////////////////////////////////////
    ////                         public methods                    ////

    /** Consume exactly one token from each input channel and output
     *  the tokens on the corresponding output channels.
     *  @exception IllegalActionException If there is no director or
     *   if the number of input channels does not equal the number of
     *   output channels.
     */
    @Override
    public void fire() throws IllegalActionException {
        super.fire();
        int outWidth = output.getWidth();
        int inWidth = input.getWidth();
        int out2Width = output2.getWidth();
        int in2Width = input2.getWidth();
        
        if (inWidth != outWidth) {
            throw new IllegalActionException(this,
                    "Unequal synchronizer I/O channels: " + inWidth + " inputs and "
                            + outWidth + " outputs.");
        } 
        else if (in2Width != out2Width) {
            throw new IllegalActionException(this,
                    "Unequal synchronizer I/O(2) channels: " + in2Width + " inputs and "
                            + out2Width + " outputs.");
        } else {
	        	output.send(0, input.get(0));
	        	output2.send(0, input2.get(0));
        		//Token inputToken = input.get(0);
        		//System.out.printf("input 1 Type: %s %n", inputToken.getType().toString());
                //output.send(0, inputToken);
                //Token input2Token = input2.get(0);
                //System.out.printf("input 2 Type: %s %n", input2Token.getType().toString());
                //output2.send(0, input2Token);
        }
    }

    /** If all of the input channels have at least one token, return
     *  what the superclass returns (presumably true).  Otherwise return
     *  false.
     *  @exception IllegalActionException If there is no director.
     */
    @Override
    public boolean prefire() throws IllegalActionException {
        if (!input.hasToken(0)) {
            return false;
        }
        if (!input2.hasToken(0)) {
            return false;
        }

        return super.prefire();
    }
}
