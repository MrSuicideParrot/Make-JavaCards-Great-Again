/*
 * Copyright 2005 Sun Microsystems, Inc. All rights reserved.
 * SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

package com.sun.javacard.samples.odSample.packageA;

import javacard.framework.*;
import com.sun.javacard.impl.*;

/**
 * Class represents nodes of a binary tree.
 **/

public class ATreeNode {
  short memUsage;
  ATreeNode left=null;
  ATreeNode right=null;

	/**
	 * Constructor. Makes children if depth of tree not reached 
	 * maxdepth yet
	 **/
  public ATreeNode(short currDepth, short maxDepth){
    memUsage=JCSystem.getAvailableMemory(JCSystem.MEMORY_TYPE_PERSISTENT);
    if(currDepth<maxDepth){
      left=new ATreeNode((short)(currDepth+1),(short)maxDepth);
      right=new ATreeNode((short)(currDepth+1),(short)maxDepth);
    }
  }
}

  
