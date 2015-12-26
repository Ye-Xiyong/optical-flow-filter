"""
    flowfilter.gpu.update
    --------------------

    :copyright: 2015, Juan David Adarve, ANU. See AUTHORS for more details
    :license: 3-clause BSD, see LICENSE for more details
"""

cimport flowfilter.gpu.image as gimg

cdef extern from 'flowfilter/gpu/update.h' namespace 'flowfilter::gpu':
    
    cdef cppclass FlowUpdate_cpp 'flowfilter::gpu::FlowUpdate':

        FlowUpdate_cpp()
        FlowUpdate_cpp(gimg.GPUImage_cpp& inputFlow,
                       gimg.GPUImage_cpp& imageConstant,
                       gimg.GPUImage_cpp& imageGradient,
                       const float gamma,
                       const float maxflow)

   
        void configure()
        void compute()
        float elapsedTime()

        float getGamma() const
        void setGamma(const float gamma)

        float getMaxFlow() const
        void setMaxFlow(const float maxflow)

        # Pipeline stage inputs
        void setInputFlow(gimg.GPUImage_cpp& inputFlow)
        void setInputImage(gimg.GPUImage_cpp& imageConstant)
        void setInputImageGradient(gimg.GPUImage_cpp& imageGradient)

        # Pipeline stage outputs
        gimg.GPUImage_cpp getUpdatedFlow()
        gimg.GPUImage_cpp getUpdatedImage()


cdef class FlowUpdate:
    
    cdef FlowUpdate_cpp flowUpd

